

with base as (

    select * 
    from `drops-bi`.`marketing_full_v2_google_ads_source`.`stg_google_ads__ad_stats_tmp`

),

fields as (

    select
        
    cast(null as STRING) as 
    
    ad_group
    
 , 
    
    
    ad_group_id
    
 as 
    
    ad_group_id
    
, 
    
    
    ad_id
    
 as 
    
    ad_id
    
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
    
, 
    cast(null as STRING) as 
    
    keyword_ad_group_criterion
    
 


        
    from base
),

final as (
    
    select 
        customer_id as account_id, 
        date as date_day, 
        
        coalesce(cast(ad_group_id as STRING), 

  
    split(
        ad_group,
        'adGroups/'
        )[safe_offset(1)]
  

) as ad_group_id,
        
        keyword_ad_group_criterion,
        ad_network_type,
        device,
        ad_id, 
        campaign_id, 
        clicks, 
        cost_micros / 1000000.0 as spend, 
        impressions
        
        





    from fields
)

select * from final