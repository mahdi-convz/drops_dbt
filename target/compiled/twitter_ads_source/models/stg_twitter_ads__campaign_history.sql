

with source as (

    select *
    from `drops-bi`.`marketing_full_v2_twitter_ads_source`.`stg_twitter_ads__campaign_history_tmp`

),

fields as (

    select
    
        
    
    
    account_id
    
 as 
    
    account_id
    
, 
    
    
    created_at
    
 as 
    
    created_at
    
, 
    
    
    currency
    
 as 
    
    currency
    
, 
    
    
    daily_budget_amount_local_micro
    
 as 
    
    daily_budget_amount_local_micro
    
, 
    
    
    deleted
    
 as 
    
    deleted
    
, 
    
    
    duration_in_days
    
 as 
    
    duration_in_days
    
, 
    
    
    end_time
    
 as 
    
    end_time
    
, 
    
    
    entity_status
    
 as 
    
    entity_status
    
, 
    
    
    frequency_cap
    
 as 
    
    frequency_cap
    
, 
    
    
    funding_instrument_id
    
 as 
    
    funding_instrument_id
    
, 
    
    
    id
    
 as 
    
    id
    
, 
    
    
    name
    
 as 
    
    name
    
, 
    
    
    servable
    
 as 
    
    servable
    
, 
    
    
    standard_delivery
    
 as 
    
    standard_delivery
    
, 
    
    
    start_time
    
 as 
    
    start_time
    
, 
    
    
    total_budget_amount_local_micro
    
 as 
    
    total_budget_amount_local_micro
    
, 
    
    
    updated_at
    
 as 
    
    updated_at
    




    from source

), 

final as (

    select
        account_id,
        created_at as created_timestamp,
        currency,
        daily_budget_amount_local_micro,
        deleted as is_deleted,
        duration_in_days,
        end_time as end_timestamp,
        entity_status,
        frequency_cap,
        funding_instrument_id,
        id as campaign_id,
        name as campaign_name,
        servable as is_servable,
        standard_delivery as is_standard_delivery,
        start_time as start_timestamp,
        total_budget_amount_local_micro,
        updated_at as updated_timestamp,
        round(daily_budget_amount_local_micro / 1000000.0,2) as daily_budget_amount,
        round(total_budget_amount_local_micro / 1000000.0,2) as total_budget_amount,
        row_number() over (partition by id order by updated_at desc) = 1 as is_latest_version
    
    from fields 
)

select * from final