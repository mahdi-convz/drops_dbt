

with base as (

    select * 
    from `drops-bi`.`marketing_facebook_ads_source`.`stg_facebook_ads__ad_set_history_tmp`
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
    
    
    campaign_id
    
 as 
    
    campaign_id
    
, 
    
    
    start_time
    
 as 
    
    start_time
    
, 
    
    
    end_time
    
 as 
    
    end_time
    
, 
    
    
    bid_strategy
    
 as 
    
    bid_strategy
    
, 
    
    
    daily_budget
    
 as 
    
    daily_budget
    
, 
    
    
    budget_remaining
    
 as 
    
    budget_remaining
    
, 
    
    
    status
    
 as 
    
    status
    



        
    from base
),

final as (
    
    select 
        updated_time as updated_at,
        cast(id as bigint) as ad_set_id,
        name as ad_set_name,
        cast(account_id as bigint) as account_id,
        cast(campaign_id as bigint) as campaign_id,
        start_time as start_at,
        end_time as end_at,
        bid_strategy,
        daily_budget,
        budget_remaining,
        status,
        row_number() over (partition by id order by updated_time desc) = 1 as is_most_recent_record
    from fields

)

select * 
from final