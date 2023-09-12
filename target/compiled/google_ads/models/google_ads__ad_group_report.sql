

with stats as (

    select *
    from `drops-bi`.`marketing_full_v2_google_ads_source`.`stg_google_ads__ad_group_stats`
), 

accounts as (

    select *
    from `drops-bi`.`marketing_full_v2_google_ads_source`.`stg_google_ads__account_history`
    where is_most_recent_record = True
), 

campaigns as (

    select *
    from `drops-bi`.`marketing_full_v2_google_ads_source`.`stg_google_ads__campaign_history`
    where is_most_recent_record = True
),

ad_groups as (

    select *
    from `drops-bi`.`marketing_full_v2_google_ads_source`.`stg_google_ads__ad_group_history`
    where is_most_recent_record = True
), 

fields as (

    select
        stats.date_day,
        accounts.account_name,
        accounts.account_id,
        accounts.currency_code,
        campaigns.campaign_name,
        campaigns.campaign_id,
        ad_groups.ad_group_name,
        stats.ad_group_id,
        ad_groups.ad_group_status,
        ad_groups.ad_group_type,
        sum(stats.spend) as spend,
        sum(stats.clicks) as clicks,
        sum(stats.impressions) as impressions

        





    from stats
    left join ad_groups
        on stats.ad_group_id = ad_groups.ad_group_id
    left join campaigns
        on ad_groups.campaign_id = campaigns.campaign_id
    left join accounts
        on campaigns.account_id = accounts.account_id
    group by 1,2,3,4,5,6,7,8,9,10
)

select *
from fields