
  
    

    create or replace table `drops-bi`.`marketing_full_v2_snapchat_ads_source`.`stg_snapchat_ads__creative_history`
      
    
    

    OPTIONS()
    as (
      

with base as (

    select * 
    from `drops-bi`.`marketing_full_v2_snapchat_ads_source`.`stg_snapchat_ads__creative_history_tmp`
),

fields as (

    select
        
    
    
    _fivetran_synced
    
 as 
    
    _fivetran_synced
    
, 
    
    
    ad_account_id
    
 as 
    
    ad_account_id
    
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
    
, 
    
    
    web_view_url
    
 as 
    
    web_view_url
    



    from base
),

final as (
    
    select 
        id as creative_id,
        cast (created_at as TIMESTAMP) as created_at,
        ad_account_id,
        name as creative_name,
        web_view_url as url,
        cast (_fivetran_synced as TIMESTAMP) as _fivetran_synced,
        cast (updated_at as TIMESTAMP) as updated_at,
        row_number() over (partition by id order by _fivetran_synced desc) =1 as is_most_recent_record
    from fields
)

select * 
from final
    );
  