

with base as (

    select * 
    from `drops-bi`.`marketing_facebook_ads_source`.`stg_facebook_ads__ad_history_tmp`
),

fields as (

    select
        
    
    
    updated_time
    
 as 
    
    updated_time
    
, 
    
    
    id
    
 as 
    
    id
    
, 
    
    
    name
    
 as 
    
    name
    
, 
    
    
    account_id
    
 as 
    
    account_id
    
, 
    
    
    ad_set_id
    
 as 
    
    ad_set_id
    
, 
    
    
    campaign_id
    
 as 
    
    campaign_id
    
, 
    
    
    creative_id
    
 as 
    
    creative_id
    



        
    from base
),

final as (
    
    select 
        updated_time as updated_at,
        cast(id as bigint) as ad_id,
        name as ad_name,
        cast(account_id as bigint) as account_id,
        cast(ad_set_id as bigint) as ad_set_id,   
        cast(campaign_id as bigint) as campaign_id,
        cast(creative_id as bigint) as creative_id,
        row_number() over (partition by id order by updated_time desc) = 1 as is_most_recent_record
    from fields
)

select * 
from final