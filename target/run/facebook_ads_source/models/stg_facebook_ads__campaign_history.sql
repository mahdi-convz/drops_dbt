
  
    

    create or replace table `drops-bi`.`marketing_facebook_ads_source`.`stg_facebook_ads__campaign_history`
    
    
    OPTIONS()
    as (
      

with base as (

    select * 
    from `drops-bi`.`marketing_facebook_ads_source`.`stg_facebook_ads__campaign_history_tmp`
),

fields as (

    select
        
    
    
    updated_time
    
 as 
    
    updated_time
    
, 
    
    
    created_time
    
 as 
    
    created_time
    
, 
    
    
    account_id
    
 as 
    
    account_id
    
, 
    
    
    id
    
 as 
    
    id
    
, 
    
    
    name
    
 as 
    
    name
    
, 
    
    
    start_time
    
 as 
    
    start_time
    
, 
    
    
    stop_time
    
 as 
    
    stop_time
    
, 
    
    
    status
    
 as 
    
    status
    
, 
    
    
    daily_budget
    
 as 
    
    daily_budget
    
, 
    
    
    lifetime_budget
    
 as 
    
    lifetime_budget
    
, 
    
    
    budget_remaining
    
 as 
    
    budget_remaining
    



        
    from base
),

final as (
    
    select 
        updated_time as updated_at,
        created_time as created_at,
        cast(account_id as bigint) as account_id,
        cast(id as bigint) as campaign_id,
        name as campaign_name,
        start_time as start_at,
        stop_time as end_at,
        status,
        daily_budget,
        lifetime_budget,
        budget_remaining,
        row_number() over (partition by id order by updated_time desc) = 1 as is_most_recent_record
    from fields

)

select * 
from final
    );
  