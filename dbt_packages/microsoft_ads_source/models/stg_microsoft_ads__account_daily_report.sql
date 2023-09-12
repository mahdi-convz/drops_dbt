{{ config(enabled=var('ad_reporting__microsoft_ads_enabled', True)) }}

with base as (

    select * 
    from {{ ref('stg_microsoft_ads__account_daily_report_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_microsoft_ads__account_daily_report_tmp')),
                staging_columns=get_account_daily_report_columns()
            )
        }}

    from base
),

final as (
    
    select 
        date as date_day,
        account_id,
        device_os,
        device_type,
        network,
        currency_code, 
        ad_distribution,
        bid_match_type,
        delivered_match_type,
        top_vs_other,
        clicks, 
        impressions,
        spend
        
        {{ fivetran_utils.fill_pass_through_columns('microsoft_ads__account_passthrough_metrics') }}
    from fields
)

select * 
from final
