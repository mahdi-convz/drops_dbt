


with  __dbt__cte__int_ad_reporting__url_report as (



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
    ,cast(base_url as STRING) as base_url 
    ,cast(campaign_id as STRING) as campaign_id 
    ,cast(campaign_name as STRING) as campaign_name 
    ,cast(clicks as INT64) as clicks

    ,cast(impressions as INT64) as impressions

    ,cast(spend as FLOAT64) as spend

    ,cast(url_host as STRING) as url_host 
    ,cast(url_path as STRING) as url_path 
    ,cast(utm_campaign as STRING) as utm_campaign 
    ,cast(utm_content as STRING) as utm_content 
    ,cast(utm_medium as STRING) as utm_medium 
    ,cast(utm_source as STRING) as utm_source 
    ,cast(utm_term as STRING) as utm_term 
    
from `drops-bi`.`marketing_google_ads`.`google_ads__url_report`

),



















unioned as (

    


select * from google_ads




)

select *
from unioned
),base as (

    select *
    from __dbt__cte__int_ad_reporting__url_report
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
        base_url,
        url_host,
        url_path,
        utm_source,
        utm_medium,
        utm_campaign,
        utm_content,
        utm_term,
        sum(clicks) as clicks,
        sum(impressions) as impressions,
        sum(spend) as spend
    from base
    group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
)

select *
from aggregated