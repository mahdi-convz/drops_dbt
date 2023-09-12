

with source as (

    select *
    from `drops-bi`.`marketing_full_v2_twitter_ads_source`.`stg_twitter_ads__line_item_history_tmp`

),

fields as (

    select
    
        
    
    
    advertiser_domain
    
 as 
    
    advertiser_domain
    
, 
    
    
    advertiser_user_id
    
 as 
    
    advertiser_user_id
    
, 
    cast(null as boolean) as 
    
    automatically_select_bid
    
 , 
    
    
    bid_amount_local_micro
    
 as 
    
    bid_amount_local_micro
    
, 
    cast(null as STRING) as 
    
    bid_type
    
 , 
    
    
    bid_unit
    
 as 
    
    bid_unit
    
, 
    
    
    campaign_id
    
 as 
    
    campaign_id
    
, 
    
    
    charge_by
    
 as 
    
    charge_by
    
, 
    
    
    created_at
    
 as 
    
    created_at
    
, 
    
    
    creative_source
    
 as 
    
    creative_source
    
, 
    
    
    currency
    
 as 
    
    currency
    
, 
    
    
    deleted
    
 as 
    
    deleted
    
, 
    
    
    end_time
    
 as 
    
    end_time
    
, 
    
    
    entity_status
    
 as 
    
    entity_status
    
, 
    
    
    id
    
 as 
    
    id
    
, 
    
    
    name
    
 as 
    
    name
    
, 
    
    
    objective
    
 as 
    
    objective
    
, 
    
    
    optimization
    
 as 
    
    optimization
    
, 
    
    
    primary_web_event_tag
    
 as 
    
    primary_web_event_tag
    
, 
    
    
    product_type
    
 as 
    
    product_type
    
, 
    
    
    start_time
    
 as 
    
    start_time
    
, 
    
    
    target_cpa_local_micro
    
 as 
    
    target_cpa_local_micro
    
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
        advertiser_domain,
        advertiser_user_id,
        automatically_select_bid,
        bid_amount_local_micro,
        bid_type,
        bid_unit,
        campaign_id,
        charge_by,
        created_at as created_timestamp,
        creative_source,
        currency,
        deleted as is_deleted,
        end_time as end_timestamp,
        entity_status,
        id as line_item_id,
        name,
        objective,
        optimization,
        primary_web_event_tag,
        product_type,
        start_time as start_timestamp,
        target_cpa_local_micro,
        total_budget_amount_local_micro,
        updated_at as updated_timestamp,
        round(bid_amount_local_micro / 1000000.0,2) as bid_amount,
        round(total_budget_amount_local_micro / 1000000.0,2) as total_budget_amount,
        round(target_cpa_local_micro / 1000000.0,2) as target_cpa,
        row_number() over (partition by id order by updated_at desc) = 1 as is_latest_version
    
    from fields 
)

select * from final