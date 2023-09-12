
  
    

    create or replace table `drops-bi`.`marketing_full_v2_apple_search_ads_source`.`stg_apple_search_ads__ad_group_report`
      
    
    

    OPTIONS()
    as (
      

with base as (

    select * 
    from `drops-bi`.`marketing_full_v2_apple_search_ads_source`.`stg_apple_search_ads__ad_group_report_tmp`
),

fields as (

    select
        
    
    
    ad_group_id
    
 as 
    
    ad_group_id
    
, 
    
    
    date
    
 as 
    
    date
    
, 
    
    
    impressions
    
 as 
    
    impressions
    
, 
    
    
    local_spend_amount
    
 as 
    
    local_spend_amount
    
, 
    
    
    local_spend_currency
    
 as 
    
    local_spend_currency
    
, 
    
    
    new_downloads
    
 as 
    
    new_downloads
    
, 
    
    
    redownloads
    
 as 
    
    redownloads
    
, 
    
    
    taps
    
 as 
    
    taps
    



    from base
),

final as (
    
    select
        date as date_day, 
        ad_group_id,
        impressions,
        local_spend_amount as spend,
        local_spend_currency as currency,
        new_downloads,
        redownloads,
        taps

        




    from fields
)

select * 
from final
    );
  