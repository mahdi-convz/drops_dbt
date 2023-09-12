
    





with  __dbt__cte__int_ad_reporting__search_report as (

    





with 



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

    ,cast(keyword_id as STRING) as keyword_id

    
    ,cast(keyword_text as STRING) as keyword_text

    
    ,cast(match_type as STRING) as search_match_type

    
    ,cast(search_term_text as STRING) as search_query

    
    ,cast(spend as FLOAT64) as spend

    
from `drops-bi`.`marketing_full_v2_apple_search_ads`.`apple_search_ads__search_term_report`

), 




unioned as (

    


select * from apple_search_ads




)

select *
from unioned
), base as (

    select *
    from __dbt__cte__int_ad_reporting__search_report
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
        search_query,
        search_match_type,
        sum(clicks) as clicks,
        sum(impressions) as impressions,
        sum(spend) as spend 

        





    from base
    group by 1,2,3,4,5,6,7,8,9,10,11,12
)

select *
from aggregated