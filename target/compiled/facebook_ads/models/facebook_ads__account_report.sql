

with report as (

    select *
    from `drops-bi`.`marketing_facebook_ads_source`.`stg_facebook_ads__basic_ad`

), 

accounts as (

    select *
    from `drops-bi`.`marketing_facebook_ads_source`.`stg_facebook_ads__account_history`
    where is_most_recent_record = true

),

joined as (

    select 
        report.date_day,
        accounts.account_id,
        accounts.account_name,
        accounts.account_status,
        accounts.business_country_code,
        accounts.created_at,
        accounts.currency,
        accounts.timezone_name,
        sum(report.clicks) as clicks,
        sum(report.impressions) as impressions,
        sum(report.spend) as spend

        




    from report 
    left join accounts
        on report.account_id = accounts.account_id
    group by 1,2,3,4,5,6,7,8
)

select *
from joined