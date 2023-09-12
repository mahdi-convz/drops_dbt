

with base as (

    select * 
    from `drops-bi`.`marketing_full_v2_apple_search_ads_source`.`stg_apple_search_ads__search_term_report_tmp`
),

fields as (

    select
        
    
    
    _fivetran_id
    
 as 
    
    _fivetran_id
    
, 
    
    
    ad_group_deleted
    
 as 
    
    ad_group_deleted
    
, 
    
    
    ad_group_id
    
 as 
    
    ad_group_id
    
, 
    
    
    ad_group_name
    
 as 
    
    ad_group_name
    
, 
    
    
    bid_amount_amount
    
 as 
    
    bid_amount_amount
    
, 
    
    
    bid_amount_currency
    
 as 
    
    bid_amount_currency
    
, 
    
    
    campaign_id
    
 as 
    
    campaign_id
    
, 
    
    
    date
    
 as 
    
    date
    
, 
    
    
    deleted
    
 as 
    
    deleted
    
, 
    
    
    impressions
    
 as 
    
    impressions
    
, 
    
    
    keyword
    
 as 
    
    keyword
    
, 
    
    
    keyword_display_status
    
 as 
    
    keyword_display_status
    
, 
    
    
    keyword_id
    
 as 
    
    keyword_id
    
, 
    
    
    local_spend_amount
    
 as 
    
    local_spend_amount
    
, 
    
    
    local_spend_currency
    
 as 
    
    local_spend_currency
    
, 
    
    
    match_type
    
 as 
    
    match_type
    
, 
    
    
    new_downloads
    
 as 
    
    new_downloads
    
, 
    
    
    redownloads
    
 as 
    
    redownloads
    
, 
    
    
    search_term_source
    
 as 
    
    search_term_source
    
, 
    
    
    search_term_text
    
 as 
    
    search_term_text
    
, 
    
    
    taps
    
 as 
    
    taps
    



    from base
),

final as (
    
    select 
        date as date_day,
        _fivetran_id,
        campaign_id,
        ad_group_id,
        ad_group_name,
        bid_amount_amount as bid_amount,
        bid_amount_currency as bid_currency,
        keyword as keyword_text,
        keyword_display_status,
        keyword_id,
        local_spend_amount as spend,
        local_spend_currency as currency,
        match_type,
        search_term_source,
        search_term_text,
        impressions,
        taps,
        new_downloads,
        redownloads

        




    from fields
)

select * 
from final