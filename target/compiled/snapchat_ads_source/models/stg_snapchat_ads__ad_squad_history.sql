

with base as (

    select * 
    from `drops-bi`.`marketing_full_v2_snapchat_ads_source`.`stg_snapchat_ads__ad_squad_history_tmp`
),

fields as (

    select
        
    
    
    _fivetran_synced
    
 as 
    
    _fivetran_synced
    
, 
    
    
    campaign_id
    
 as 
    
    campaign_id
    
, 
    
    
    created_at
    
 as 
    
    created_at
    
, 
    
    
    id
    
 as 
    
    id
    
, 
    
    
    name
    
 as 
    
    name
    
, 
    
    
    updated_at
    
 as 
    
    updated_at
    



    from base
),

final as (

    select 
        id as ad_squad_id,
        name as ad_squad_name,
        cast (created_at as TIMESTAMP) as created_at,
        campaign_id,
        cast (_fivetran_synced as TIMESTAMP) as _fivetran_synced,
        cast (updated_at as TIMESTAMP) as updated_at,
        row_number() over (partition by id order by _fivetran_synced desc) = 1 as is_most_recent_record
    from fields
)

select * 
from final