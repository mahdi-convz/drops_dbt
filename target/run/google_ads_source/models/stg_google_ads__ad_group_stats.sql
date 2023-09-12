
  
    

    create or replace table `drops-bi`.`marketing_full_v2_google_ads_source`.`stg_google_ads__ad_group_stats`
      
    
    

    OPTIONS()
    as (
      

with base as (

    select * 
    from `drops-bi`.`marketing_full_v2_google_ads_source`.`stg_google_ads__ad_group_stats_tmp`
),

fields as (

    select
        
    
    
    _fivetran_id
    
 as 
    
    _fivetran_id
    
, 
    
    
    _fivetran_synced
    
 as 
    
    _fivetran_synced
    
, 
    
    
    ad_network_type
    
 as 
    
    ad_network_type
    
, 
    
    
    campaign_id
    
 as 
    
    campaign_id
    
, 
    
    
    clicks
    
 as 
    
    clicks
    
, 
    
    
    cost_micros
    
 as 
    
    cost_micros
    
, 
    
    
    customer_id
    
 as 
    
    customer_id
    
, 
    
    
    date
    
 as 
    
    date
    
, 
    
    
    device
    
 as 
    
    device
    
, 
    
    
    id
    
 as 
    
    id
    
, 
    
    
    impressions
    
 as 
    
    impressions
    



    from base
),

final as (
    
    select
        customer_id as account_id, 
        date as date_day, 
        cast(id as STRING) as ad_group_id, 
        campaign_id, 
        device,
        ad_network_type,
        clicks, 
        cost_micros / 1000000.0 as spend, 
        impressions
        
        





    from fields
)

select *
from final
    );
  