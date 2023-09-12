

with source as (

    select *
    from `drops-bi`.`marketing_full_v2_twitter_ads_source`.`stg_twitter_ads__promoted_tweet_history_tmp`

),

fields as (

    select
    
        
    
    
    approval_status
    
 as 
    
    approval_status
    
, 
    
    
    created_at
    
 as 
    
    created_at
    
, 
    
    
    deleted
    
 as 
    
    deleted
    
, 
    
    
    entity_status
    
 as 
    
    entity_status
    
, 
    
    
    id
    
 as 
    
    id
    
, 
    
    
    line_item_id
    
 as 
    
    line_item_id
    
, 
    
    
    tweet_id
    
 as 
    
    tweet_id
    
, 
    
    
    updated_at
    
 as 
    
    updated_at
    




    from source

), 

final as (

    select
        approval_status,
        created_at as created_timestamp,
        deleted as is_deleted,
        entity_status,
        id as promoted_tweet_id,
        line_item_id,
        tweet_id,
        updated_at as updated_timestamp,
        row_number() over (partition by id order by updated_at desc) = 1 as is_latest_version
    from fields 
)

select * from final