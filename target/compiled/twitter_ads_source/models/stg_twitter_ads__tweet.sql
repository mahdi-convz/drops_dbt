

with base as (

    select * 
    from `drops-bi`.`marketing_full_v2_twitter_ads_source`.`stg_twitter_ads__tweet_tmp`
),

fields as (

    select
        
    
    
    account_id
    
 as 
    
    account_id
    
, 
    
    
    full_text
    
 as 
    
    full_text
    
, 
    
    
    id
    
 as 
    
    id
    
, 
    
    
    lang
    
 as 
    
    lang
    
, 
    
    
    name
    
 as 
    
    name
    



    from base
),

final as (
    
    select 
        account_id,
        id as tweet_id,
        name,
        full_text,
        lang as language

    from fields
)

select *
from final