

with base as (

    select * 
    from `drops-bi`.`marketing_full_v2_google_ads_source`.`stg_google_ads__keyword_stats_tmp`
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
    
    
    ad_group_criterion_criterion_id
    
 as 
    
    ad_group_criterion_criterion_id
    
, 
    
    
    ad_group_id
    
 as 
    
    ad_group_id
    
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
    
    
    impressions
    
 as 
    
    impressions
    



    from base
),

final as (
    
    select 
        _fivetran_id as keyword_id,
        customer_id as account_id, 
        date as date_day, 
        cast(ad_group_id as STRING) as ad_group_id,
        ad_group_criterion_criterion_id as criterion_id,
        campaign_id, 
        clicks, 
        cost_micros / 1000000.0 as spend, 
        impressions
        
        





    from fields
)

select *
from final