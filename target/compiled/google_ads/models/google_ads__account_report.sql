

with stats as (

    select *
    from `drops-bi`.`marketing_full_v2_google_ads_source`.`stg_google_ads__account_stats`
), 

accounts as (

    select *
    from `drops-bi`.`marketing_full_v2_google_ads_source`.`stg_google_ads__account_history`
    where is_most_recent_record = True
), 

fields as (

    select
        stats.date_day,
        accounts.account_name,
        stats.account_id,
        accounts.currency_code,
        accounts.auto_tagging_enabled,
        accounts.time_zone,
        sum(stats.spend) as spend,
        sum(stats.clicks) as clicks,
        sum(stats.impressions) as impressions

        





    from stats
    left join accounts
        on stats.account_id = accounts.account_id
    group by 1,2,3,4,5,6
)

select *
from fields