
  
    

    create or replace table `drops-bi`.`marketing_full_v2_apple_search_ads_source`.`stg_apple_search_ads__campaign_history`
      
    
    

    OPTIONS()
    as (
      

with base as (

    select * 
    from `drops-bi`.`marketing_full_v2_apple_search_ads_source`.`stg_apple_search_ads__campaign_history_tmp`
),

fields as (

    select
        
    
    
    end_time
    
 as 
    
    end_time
    
, 
    
    
    id
    
 as 
    
    id
    
, 
    
    
    modification_time
    
 as 
    
    modification_time
    
, 
    
    
    name
    
 as 
    
    name
    
, 
    
    
    organization_id
    
 as 
    
    organization_id
    
, 
    
    
    start_time
    
 as 
    
    start_time
    
, 
    
    
    status
    
 as 
    
    status
    



        
    from base
),

final as (
    
    select
        modification_time as modified_at,
        organization_id,
        name as campaign_name,
        id as campaign_id,
        status as campaign_status,
        start_time as start_at,
        end_time as end_at,
        row_number() over (partition by id order by modification_time desc) = 1 as is_most_recent_record
    from fields
)

select * 
from final
    );
  