
  
    

    create or replace table `drops-bi`.`marketing_full_v2_stg_tiktok_ads`.`stg_tiktok_ads__campaign_history`
      
    
    

    OPTIONS()
    as (
      

with base as (

    select *
    from `drops-bi`.`marketing_full_v2_stg_tiktok_ads`.`stg_tiktok_ads__campaign_history_tmp`
), 

fields as (

    select
        
    
    
    advertiser_id
    
 as 
    
    advertiser_id
    
, 
    
    
    campaign_id
    
 as 
    
    campaign_id
    
, 
    
    
    campaign_name
    
 as 
    
    campaign_name
    
, 
    
    
    campaign_type
    
 as 
    
    campaign_type
    
, 
    
    
    split_test_variable
    
 as 
    
    split_test_variable
    
, 
    
    
    updated_at
    
 as 
    
    updated_at
    



    from base
), 

final as (

    select   
        campaign_id,
        cast(updated_at as TIMESTAMP) as updated_at,
        advertiser_id,
        campaign_name,
        campaign_type,
        split_test_variable,
        row_number() over (partition by campaign_id order by updated_at desc) = 1 as is_most_recent_record
    from fields
)

select *
from final
    );
  