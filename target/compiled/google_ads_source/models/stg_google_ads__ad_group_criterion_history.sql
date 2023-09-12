

with base as (

    select * 
    from `drops-bi`.`marketing_full_v2_google_ads_source`.`stg_google_ads__ad_group_criterion_history_tmp`
),

fields as (

    select
        
    
    
    id
    
 as 
    
    id
    
, 
    
    
    ad_group_id
    
 as 
    
    ad_group_id
    
, 
    cast(null as INT64) as 
    
    base_campaign_id
    
 , 
    
    
    _fivetran_synced
    
 as 
    
    _fivetran_synced
    
, 
    
    
    updated_at
    
 as 
    
    updated_at
    
, 
    
    
    type
    
 as 
    
    type
    
, 
    
    
    status
    
 as 
    
    status
    
, 
    
    
    keyword_match_type
    
 as 
    
    keyword_match_type
    
, 
    
    
    keyword_text
    
 as 
    
    keyword_text
    
, 
    
    
    _fivetran_active
    
 as 
    
    _fivetran_active
    



    from base
),

final as (
    
    select 
        id as criterion_id,
        cast(ad_group_id as STRING) as ad_group_id,
        base_campaign_id,
        updated_at,
        type,
        status,
        keyword_match_type,
        keyword_text,
        row_number() over (partition by id order by updated_at desc) = 1 as is_most_recent_record
    from fields
    where coalesce(_fivetran_active, true)
)

select *
from final