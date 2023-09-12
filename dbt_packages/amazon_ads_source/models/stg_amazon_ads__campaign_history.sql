{{ config(enabled=var('ad_reporting__amazon_ads_enabled', True)) }}

with base as (

    select * 
    from {{ ref('stg_amazon_ads__campaign_history_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_amazon_ads__campaign_history_tmp')),
                staging_columns=get_campaign_history_columns()
            )
        }}
    from base
),

final as (
    
    select 
        cast(id as {{ dbt.type_string() }}) as campaign_id,
        last_updated_date,
        bidding_strategy,
        creation_date,
        end_date,
        name as campaign_name,
        cast(portfolio_id as {{ dbt.type_string() }}) as portfolio_id,
        cast(profile_id as {{ dbt.type_string() }}) as profile_id,
        serving_status,
        start_date,
        state,
        targeting_type,
        budget,
        budget_type,
        effective_budget,
        row_number() over (partition by id order by last_updated_date desc) = 1 as is_most_recent_record
    from fields
)

select *
from final
