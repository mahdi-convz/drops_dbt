


with


twitter_ads as (
    select 
    

    cast(date_day as date)

 as date_day,
    cast( 'twitter_ads' as STRING) as platform,

    cast(account_id as STRING) as account_id

    
    ,cast(account_name as STRING) as account_name

    
    ,cast(clicks as INT64) as clicks

    ,cast(impressions as INT64) as impressions

    ,cast(spend as FLOAT64) as spend

    
from `drops-bi`.`marketing_full_v2_twitter_ads`.`twitter_ads__account_report`

),





google_ads as (
    select 
    

    cast(date_day as date)

 as date_day,
    cast( 'google_ads' as STRING) as platform,

    cast(account_id as STRING) as account_id

    
    ,cast(account_name as STRING) as account_name

    
    ,cast(clicks as INT64) as clicks

    ,cast(impressions as INT64) as impressions

    ,cast(spend as FLOAT64) as spend

    
from `drops-bi`.`marketing_full_v2_google_ads`.`google_ads__account_report`

),






apple_search_ads as (

    select 
    

    cast(date_day as date)

 as date_day,
    cast( 'apple_search_ads' as STRING) as platform,

    cast(organization_id as STRING) as account_id

    
    ,cast(organization_name as STRING) as account_name

    
    ,cast(taps as INT64) as clicks

    ,cast(impressions as INT64) as impressions

    ,cast(spend as FLOAT64) as spend

    
from `drops-bi`.`marketing_full_v2_apple_search_ads`.`apple_search_ads__organization_report`

),







snapchat_ads as (

    select 
    

    cast(date_day as date)

 as date_day,
    cast( 'snapchat_ads' as STRING) as platform,

    cast(ad_account_id as STRING) as account_id

    
    ,cast(ad_account_name as STRING) as account_name

    
    ,cast(swipes as INT64) as clicks

    ,cast(impressions as INT64) as impressions

    ,cast(spend as FLOAT64) as spend

    
from `drops-bi`.`marketing_full_v2_snapchat_ads`.`snapchat_ads__account_report`

), 



tiktok_ads as (

    select 
    

    cast(date_day as date)

 as date_day,
    cast( 'tiktok_ads' as STRING) as platform,

    cast(advertiser_id as STRING) as account_id

    
    ,cast(advertiser_name as STRING) as account_name

    
    ,cast(clicks as INT64) as clicks

    ,cast(impressions as INT64) as impressions

    ,cast(spend as FLOAT64) as spend

    
from `drops-bi`.`marketing_full_v2_tiktok_ads`.`tiktok_ads__advertiser_report`

), 






unioned as (

    


select * from apple_search_ads

union all

select * from google_ads

union all

select * from snapchat_ads

union all

select * from tiktok_ads

union all

select * from twitter_ads




)

select *
from unioned