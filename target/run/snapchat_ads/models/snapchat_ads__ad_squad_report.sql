
  
    

    create or replace table `drops-bi`.`marketing_full_v2_snapchat_ads`.`snapchat_ads__ad_squad_report`
      
    
    

    OPTIONS()
    as (
      

with ad_squad_hourly as (

    select *
    from `drops-bi`.`marketing_full_v2_snapchat_ads_source`.`stg_snapchat_ads__ad_squad_hourly_report`

), account as (

    select *
    from `drops-bi`.`marketing_full_v2_snapchat_ads_source`.`stg_snapchat_ads__ad_account_history`
    where is_most_recent_record = true

), ad_squads as (

    select *
    from `drops-bi`.`marketing_full_v2_snapchat_ads_source`.`stg_snapchat_ads__ad_squad_history`
    where is_most_recent_record = true

), campaigns as (

    select *
    from `drops-bi`.`marketing_full_v2_snapchat_ads_source`.`stg_snapchat_ads__campaign_history`
    where is_most_recent_record = true


), aggregated as (

    select
        cast(ad_squad_hourly.date_hour as date) as date_day,
        account.ad_account_id,
        account.ad_account_name,
        campaigns.campaign_id,
        campaigns.campaign_name,
        ad_squad_hourly.ad_squad_id,
        ad_squads.ad_squad_name,
        account.currency,
        sum(ad_squad_hourly.swipes) as swipes,
        sum(ad_squad_hourly.impressions) as impressions,
        round(sum(ad_squad_hourly.spend),2) as spend
        
        




    
    from ad_squad_hourly
    left join ad_squads
        on ad_squad_hourly.ad_squad_id = ad_squads.ad_squad_id
    left join campaigns
        on ad_squads.campaign_id = campaigns.campaign_id
    left join account
        on campaigns.ad_account_id = account.ad_account_id
    
    group by 1,2,3,4,5,6,7,8

)

select *
from aggregated
    );
  