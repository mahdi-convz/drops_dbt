

with campaign_hourly as (

    select *
    from `drops-bi`.`marketing_full_v2_snapchat_ads_source`.`stg_snapchat_ads__campaign_hourly_report`

), account as (

    select *
    from `drops-bi`.`marketing_full_v2_snapchat_ads_source`.`stg_snapchat_ads__ad_account_history`
    where is_most_recent_record = true

), campaigns as (

    select *
    from `drops-bi`.`marketing_full_v2_snapchat_ads_source`.`stg_snapchat_ads__campaign_history`
    where is_most_recent_record = true


), aggregated as (

    select
        cast(campaign_hourly.date_hour as date) as date_day,
        account.ad_account_id,
        account.ad_account_name,
        campaign_hourly.campaign_id,
        campaigns.campaign_name,
        account.currency,
        sum(campaign_hourly.swipes) as swipes,
        sum(campaign_hourly.impressions) as impressions,
        round(sum(campaign_hourly.spend),2) as spend
        
        




    
    from campaign_hourly
    left join campaigns
        on campaign_hourly.campaign_id = campaigns.campaign_id
    left join account
        on campaigns.ad_account_id = account.ad_account_id
    
    group by 1,2,3,4,5,6

)

select *
from aggregated