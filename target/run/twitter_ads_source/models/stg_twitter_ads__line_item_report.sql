
  
    

    create or replace table `drops-bi`.`marketing_full_v2_twitter_ads_source`.`stg_twitter_ads__line_item_report`
      
    
    

    OPTIONS()
    as (
      

with base as (

    select * 
    from `drops-bi`.`marketing_full_v2_twitter_ads_source`.`stg_twitter_ads__line_item_report_tmp`
),

fields as (

    select
        
    
    
    account_id
    
 as 
    
    account_id
    
, 
    
    
    billed_charge_local_micro
    
 as 
    
    billed_charge_local_micro
    
, 
    
    
    clicks
    
 as 
    
    clicks
    
, 
    
    
    date
    
 as 
    
    date
    
, 
    
    
    impressions
    
 as 
    
    impressions
    
, 
    
    
    line_item_id
    
 as 
    
    line_item_id
    
, 
    
    
    placement
    
 as 
    
    placement
    
, 
    
    
    url_clicks
    
 as 
    
    url_clicks
    



    from base
),

final as (
    
    select 
        timestamp_trunc(
        cast(date as timestamp),
        day
    ) as date_day,
        account_id,
        line_item_id,
        placement,
        clicks,
        impressions,
        billed_charge_local_micro as spend_micro,
        round(billed_charge_local_micro / 1000000.0,2) as spend,
        url_clicks

        





    from fields
)

select *
from final
    );
  