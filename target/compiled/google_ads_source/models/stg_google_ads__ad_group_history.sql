

with base as (

    select * 
    from `drops-bi`.`marketing_full_v2_google_ads_source`.`stg_google_ads__ad_group_history_tmp`

),

fields as (

    select
        
    
    
    campaign_id
    
 as 
    
    campaign_id
    
, 
    
    
    campaign_name
    
 as 
    
    campaign_name
    
, 
    
    
    id
    
 as 
    
    id
    
, 
    
    
    name
    
 as 
    
    name
    
, 
    
    
    status
    
 as 
    
    status
    
, 
    
    
    type
    
 as 
    
    type
    
, 
    
    
    updated_at
    
 as 
    
    updated_at
    
, 
    
    
    _fivetran_active
    
 as 
    
    _fivetran_active
    



        
    from base
),

final as (
    
    select 
        cast(id as STRING) as ad_group_id,
        updated_at,
        type as ad_group_type, 
        campaign_id, 
        campaign_name, 
        name as ad_group_name, 
        status as ad_group_status,
        row_number() over (partition by id order by updated_at desc) = 1 as is_most_recent_record
    from fields
    where coalesce(_fivetran_active, true)
)

select * 
from final