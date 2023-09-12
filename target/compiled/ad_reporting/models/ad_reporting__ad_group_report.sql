


with  __dbt__cte__int_ad_reporting__ad_group_report as (



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

    ,cast(spend as FLOAT64) as spend

    
from `drops-bi`.`marketing_full_v2_google_ads`.`google_ads__ad_group_report`

),






apple_search_ads as (

    select 
    

    cast(date_day as date)

 as date_day,
    cast( 'apple_search_ads' as STRING) as platform,

    cast(organization_id as STRING) as account_id

    
    ,cast(organization_name as STRING) as account_name

    
    ,cast(ad_group_id as STRING) as ad_group_id

    
    ,cast(ad_group_name as STRING) as ad_group_name

    
    ,cast(campaign_id as STRING) as campaign_id

    
    ,cast(campaign_name as STRING) as campaign_name

    
    ,cast(taps as INT64) as clicks

    ,cast(impressions as INT64) as impressions

    ,cast(spend as FLOAT64) as spend

    
from `drops-bi`.`marketing_full_v2_apple_search_ads`.`apple_search_ads__ad_group_report`

),









snapchat_ads as (

    select 
    

    cast(date_day as date)

 as date_day,
    cast( 'snapchat_ads' as STRING) as platform,

    cast(ad_account_id as STRING) as account_id

    
    ,cast(ad_account_name as STRING) as account_name

    
    ,cast(ad_squad_id as STRING) as ad_group_id

    
    ,cast(ad_squad_name as STRING) as ad_group_name

    
    ,cast(campaign_id as STRING) as campaign_id

    
    ,cast(campaign_name as STRING) as campaign_name

    
    ,cast(swipes as INT64) as clicks

    ,cast(impressions as INT64) as impressions

    ,cast(spend as FLOAT64) as spend

    
from `drops-bi`.`marketing_full_v2_snapchat_ads`.`snapchat_ads__ad_squad_report`

), 



tiktok_ads as (

    select 
    

    cast(date_day as date)

 as date_day,
    cast( 'tiktok_ads' as STRING) as platform,

    cast(advertiser_id as STRING) as account_id

    
    ,cast(advertiser_name as STRING) as account_name

    
    ,cast(ad_group_id as STRING) as ad_group_id

    
    ,cast(ad_group_name as STRING) as ad_group_name

    
    ,cast(campaign_id as STRING) as campaign_id

    
    ,cast(campaign_name as STRING) as campaign_name

    
    ,cast(clicks as INT64) as clicks

    ,cast(impressions as INT64) as impressions

    ,cast(spend as FLOAT64) as spend

    
from `drops-bi`.`marketing_full_v2_tiktok_ads`.`tiktok_ads__ad_group_report`

), 



twitter_ads as (

    select 
    

    cast(date_day as date)

 as date_day,
    cast( 'twitter_ads' as STRING) as platform,

    cast(account_id as STRING) as account_id

    
    ,cast(account_name as STRING) as account_name

    
    ,cast(line_item_id as STRING) as ad_group_id

    
    ,cast(line_item_name as STRING) as ad_group_name

    
    ,cast(campaign_id as STRING) as campaign_id

    
    ,cast(campaign_name as STRING) as campaign_name

    
    ,cast(clicks as INT64) as clicks

    ,cast(impressions as INT64) as impressions

    ,cast(spend as FLOAT64) as spend

    
from `drops-bi`.`marketing_full_v2_twitter_ads`.`twitter_ads__line_item_report`

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
), base as (

    select *
    from __dbt__cte__int_ad_reporting__ad_group_report
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
        sum(clicks) as clicks,
        sum(impressions) as impressions,
        sum(spend) as spend 

        





    from base
    group by 1,2,3,4,5,6,7,8
)

select *
from aggregated