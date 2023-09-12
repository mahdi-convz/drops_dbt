
  
    

    create or replace table `drops-bi`.`marketing_full_v2_google_ads_source`.`stg_google_ads__campaign_history`
      
    
    

    OPTIONS()
    as (
      

with base as (

    select * 
    from `drops-bi`.`marketing_full_v2_google_ads_source`.`stg_google_ads__campaign_history_tmp`

),

fields as (

    select
        
    
    
    advertising_channel_subtype
    
 as 
    
    advertising_channel_subtype
    
, 
    
    
    advertising_channel_type
    
 as 
    
    advertising_channel_type
    
, 
    
    
    customer_id
    
 as 
    
    customer_id
    
, 
    
    
    end_date
    
 as 
    
    end_date
    
, 
    
    
    id
    
 as 
    
    id
    
, 
    
    
    name
    
 as 
    
    name
    
, 
    
    
    serving_status
    
 as 
    
    serving_status
    
, 
    
    
    start_date
    
 as 
    
    start_date
    
, 
    
    
    status
    
 as 
    
    status
    
, 
    
    
    tracking_url_template
    
 as 
    
    tracking_url_template
    
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
        id as campaign_id, 
        updated_at,
        name as campaign_name,
        customer_id as account_id,
        advertising_channel_type,
        advertising_channel_subtype,
        start_date,
        end_date,
        serving_status,
        status,
        tracking_url_template,
        row_number() over (partition by id order by updated_at desc) = 1 as is_most_recent_record
    from fields
    where coalesce(_fivetran_active, true)
)

select * 
from final
    );
  