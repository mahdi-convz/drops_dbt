

with report as (

    select *
    from `drops-bi`.`marketing_facebook_ads_source`.`stg_facebook_ads__basic_ad`

), 

accounts as (

    select *
    from `drops-bi`.`marketing_facebook_ads_source`.`stg_facebook_ads__account_history`
    where is_most_recent_record = true

),

campaigns as (

    select *
    from `drops-bi`.`marketing_facebook_ads_source`.`stg_facebook_ads__campaign_history`
    where is_most_recent_record = true

),

ads as (

    select *
    from `drops-bi`.`marketing_facebook_ads_source`.`stg_facebook_ads__ad_history`
    where is_most_recent_record = true

),

joined as (

    select 
        report.date_day,
        accounts.account_id,
        accounts.account_name,
        campaigns.campaign_id,
        campaigns.campaign_name,
        campaigns.start_at,
        campaigns.end_at,
        campaigns.status,
        campaigns.daily_budget,
        campaigns.lifetime_budget,
        campaigns.budget_remaining,
        sum(report.clicks) as clicks,
        sum(report.impressions) as impressions,
        sum(report.spend) as spend

        




    from report 
    left join accounts
        on report.account_id = accounts.account_id
    left join ads 
        on report.ad_id = ads.ad_id
    left join campaigns
        on ads.campaign_id = campaigns.campaign_id
    group by 1,2,3,4,5,6,7,8,9,10,11
)

select *
from joined