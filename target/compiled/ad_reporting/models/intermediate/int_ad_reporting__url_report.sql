


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