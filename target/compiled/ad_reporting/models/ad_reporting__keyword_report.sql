
    





with  __dbt__cte__int_ad_reporting__keyword_report as (

    





with



google_ads as (

    select 
    

    cast(date_day as date)

 as date_day,
    cast( 'google_ads' as STRING) as platform,

    cast(account_id as STRING) as account_id 
    ,cast(account_name as STRING) as account_name 
    ,cast(ad_group_id as STRING) as ad_group_id 
    ,cast(ad_group_name as STRING) as ad_group_name 
    ,cast(campaign_id as STRING) as campaign_id 
    ,cast(campaign_name as STRING) as campaign_name 
    ,cast(clicks as INT64) as clicks

    ,cast(impressions as INT64) as impressions

    ,cast(criterion_id as STRING) as keyword_id 
    ,cast(keyword_match_type as STRING) as keyword_match_type 
    ,cast(keyword_text as STRING) as keyword_text 
    ,cast(spend as FLOAT64) as spend

    
from `drops-bi`.`marketing_google_ads`.`google_ads__keyword_report`

),










unioned as (

    


select * from google_ads




)

select *
from unioned
),base as (

    select *
    from __dbt__cte__int_ad_reporting__keyword_report
),

aggregated as (
    
    select 
        date_day,
        platform,
        account_id,
        account_name,
        campaign_id,
        campaign_name,
        ad_group_id,
        ad_group_name,
        keyword_id,
        keyword_text,
        keyword_match_type,
        sum(clicks) as clicks,
        sum(impressions) as impressions,
        sum(spend) as spend
    from base
    group by 1,2,3,4,5,6,7,8,9,10,11
)

select *
from aggregated