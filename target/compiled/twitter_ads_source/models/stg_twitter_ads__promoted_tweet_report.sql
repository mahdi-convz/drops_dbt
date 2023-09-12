

with source as (

    select *
    from `drops-bi`.`marketing_full_v2_twitter_ads_source`.`stg_twitter_ads__promoted_tweet_report_tmp`

),

renamed as (

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
    
    
    placement
    
 as 
    
    placement
    
, 
    
    
    promoted_tweet_id
    
 as 
    
    promoted_tweet_id
    
, 
    
    
    url_clicks
    
 as 
    
    url_clicks
    




    from source

), spend_calc as (

    select
        timestamp_trunc(
        cast(date as timestamp),
        day
    ) as date_day,
        account_id,
        promoted_tweet_id,
        placement,
        clicks as clicks,
        impressions as impressions,
        billed_charge_local_micro as spend_micro,
        round(billed_charge_local_micro / 1000000.0,2) as spend,
        url_clicks as url_clicks

        




    
    from renamed

)

select * from spend_calc