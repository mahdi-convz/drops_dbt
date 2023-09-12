

with base as (

    select * 
    from `drops-bi`.`marketing_full_v2_apple_search_ads_source`.`stg_apple_search_ads__organization_tmp`
),

fields as (

    select
        
    
    
    currency
    
 as 
    
    currency
    
, 
    
    
    id
    
 as 
    
    id
    
, 
    
    
    name
    
 as 
    
    name
    
, 
    
    
    payment_model
    
 as 
    
    payment_model
    
, 
    
    
    time_zone
    
 as 
    
    time_zone
    



        
    from base
),

final as (
    
    select 
        id as organization_id,
        currency,
        payment_model,
        name as organization_name,
        time_zone
    from fields
)

select * 
from final