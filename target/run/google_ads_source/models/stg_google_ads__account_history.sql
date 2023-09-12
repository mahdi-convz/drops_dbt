
  
    

    create or replace table `drops-bi`.`marketing_full_v2_google_ads_source`.`stg_google_ads__account_history`
      
    
    

    OPTIONS()
    as (
      

with base as (

    select * 
    from `drops-bi`.`marketing_full_v2_google_ads_source`.`stg_google_ads__account_history_tmp`

),

fields as (

    select
        
    
    
    _fivetran_synced
    
 as 
    
    _fivetran_synced
    
, 
    
    
    auto_tagging_enabled
    
 as 
    
    auto_tagging_enabled
    
, 
    
    
    currency_code
    
 as 
    
    currency_code
    
, 
    
    
    descriptive_name
    
 as 
    
    descriptive_name
    
, 
    
    
    id
    
 as 
    
    id
    
, 
    
    
    time_zone
    
 as 
    
    time_zone
    
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
        id as account_id,
        updated_at,
        currency_code,
        auto_tagging_enabled,
        time_zone,
        descriptive_name as account_name,
        row_number() over (partition by id order by updated_at desc) = 1 as is_most_recent_record
    from fields
    where coalesce(_fivetran_active, true)
)

select * 
from final
    );
  