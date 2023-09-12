{{ config(enabled=var('ad_reporting__snapchat_ads_enabled', true)) }}

with base as (

    select * 
    from {{ ref('stg_snapchat_ads__creative_url_tag_history_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_snapchat_ads__creative_url_tag_history_tmp')),
                staging_columns=get_creative_url_tag_history_columns()
            )
        }}
        
    from base
),

final as (
    
    select  
        creative_id,
        key as param_key,
        value as param_value,
        cast (updated_at as {{ dbt.type_timestamp() }}) as updated_at,
        row_number() over (partition by creative_id, key order by updated_at desc) =1 as is_most_recent_record
    from fields
)

select * 
from final
