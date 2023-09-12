

with base as (

    select * 
    from `drops-bi`.`marketing_facebook_ads_source`.`stg_facebook_ads__basic_ad_tmp`
),

fields as (

    select
        
    
    
    ad_id
    
 as 
    
    ad_id
    
, 
    
    
    ad_name
    
 as 
    
    ad_name
    
, 
    
    
    adset_name
    
 as 
    
    adset_name
    
, 
    
    
    date
    
 as 
    
    date
    
, 
    
    
    account_id
    
 as 
    
    account_id
    
, 
    
    
    impressions
    
 as 
    
    impressions
    
, 
    
    
    inline_link_clicks
    
 as 
    
    inline_link_clicks
    
, 
    
    
    spend
    
 as 
    
    spend
    
, 
    
    
    reach
    
 as 
    
    reach
    
, 
    
    
    frequency
    
 as 
    
    frequency
    



        
    from base
),

final as (
    
    select 
        cast(ad_id as bigint) as ad_id,
        ad_name,
        adset_name as ad_set_name,
        date as date_day,
        cast(account_id as bigint) as account_id,
        impressions,
        coalesce(inline_link_clicks,0) as clicks,
        spend,
        reach,
        frequency

        




    from fields
)

select * 
from final