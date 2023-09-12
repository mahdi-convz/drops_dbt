

with source as (

    select *
    from `drops-bi`.`marketing_full_v2_twitter_ads_source`.`stg_twitter_ads__account_history_tmp`

),

fields as (

    select
    
        
    
    
    approval_status
    
 as 
    
    approval_status
    
, 
    
    
    business_id
    
 as 
    
    business_id
    
, 
    
    
    business_name
    
 as 
    
    business_name
    
, 
    
    
    created_at
    
 as 
    
    created_at
    
, 
    
    
    deleted
    
 as 
    
    deleted
    
, 
    
    
    id
    
 as 
    
    id
    
, 
    
    
    industry_type
    
 as 
    
    industry_type
    
, 
    
    
    name
    
 as 
    
    name
    
, 
    
    
    salt
    
 as 
    
    salt
    
, 
    
    
    timezone
    
 as 
    
    timezone
    
, 
    
    
    timezone_switch_at
    
 as 
    
    timezone_switch_at
    
, 
    
    
    updated_at
    
 as 
    
    updated_at
    




    from source

), 

final as (

    select
        approval_status,
        business_id,
        business_name,
        created_at as created_timestamp,
        deleted as is_deleted,
        id as account_id,
        industry_type,
        name,
        salt,
        timezone,
        timezone_switch_at as timezone_switched_timestamp,
        updated_at as updated_timestamp,
        row_number() over (partition by id order by updated_at desc) = 1 as is_latest_version
    
    from fields 
)

select * from final