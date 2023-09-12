
  
    

    create or replace table `drops-bi`.`marketing_facebook_ads_source`.`stg_facebook_ads__account_history`
    
    
    OPTIONS()
    as (
      

with base as (

    select * 
    from `drops-bi`.`marketing_facebook_ads_source`.`stg_facebook_ads__account_history_tmp`
),

fields as (

    select
        
    
    
    id
    
 as 
    
    id
    
, 
    
    
    _fivetran_synced
    
 as 
    
    _fivetran_synced
    
, 
    
    
    name
    
 as 
    
    name
    
, 
    
    
    account_status
    
 as 
    
    account_status
    
, 
    
    
    business_country_code
    
 as 
    
    business_country_code
    
, 
    
    
    created_time
    
 as 
    
    created_time
    
, 
    
    
    currency
    
 as 
    
    currency
    
, 
    
    
    timezone_name
    
 as 
    
    timezone_name
    



        
    from base
),

final as (
    
    select 
        cast(id as bigint) as account_id,
        _fivetran_synced,
        name as account_name,
        account_status,
        business_country_code,
        created_time as created_at,
        currency,
        timezone_name,
        row_number() over (partition by id order by _fivetran_synced desc) = 1 as is_most_recent_record
    from fields

)

select * 
from final
    );
  