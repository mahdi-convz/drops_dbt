
    





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