

with base as (

    select * 
    from `drops-bi`.`marketing_facebook_ads_source`.`stg_facebook_ads__creative_history_tmp`
),

fields as (

    select
        
    
    
    _fivetran_id
    
 as 
    
    _fivetran_id
    
, 
    
    
    _fivetran_synced
    
 as 
    
    _fivetran_synced
    
, 
    
    
    id
    
 as 
    
    id
    
, 
    
    
    account_id
    
 as 
    
    account_id
    
, 
    
    
    name
    
 as 
    
    name
    
, 
    
    
    page_link
    
 as 
    
    page_link
    
, 
    
    
    template_page_link
    
 as 
    
    template_page_link
    
, 
    
    
    url_tags
    
 as 
    
    url_tags
    
, 
    
    
    asset_feed_spec_link_urls
    
 as 
    
    asset_feed_spec_link_urls
    
, 
    
    
    object_story_link_data_child_attachments
    
 as 
    
    object_story_link_data_child_attachments
    
, 
    
    
    object_story_link_data_caption
    
 as 
    
    object_story_link_data_caption
    
, 
    
    
    object_story_link_data_description
    
 as 
    
    object_story_link_data_description
    
, 
    
    
    object_story_link_data_link
    
 as 
    
    object_story_link_data_link
    
, 
    
    
    object_story_link_data_message
    
 as 
    
    object_story_link_data_message
    
, 
    
    
    template_app_link_spec_android
    
 as 
    
    template_app_link_spec_android
    
, 
    
    
    template_app_link_spec_ios
    
 as 
    
    template_app_link_spec_ios
    
, 
    
    
    template_app_link_spec_ipad
    
 as 
    
    template_app_link_spec_ipad
    
, 
    
    
    template_app_link_spec_iphone
    
 as 
    
    template_app_link_spec_iphone
    



        
    from base
),

final as (
    
    select 
        _fivetran_id,
        _fivetran_synced,
        cast(id as bigint) as creative_id,
        cast(account_id as bigint) as account_id,
        name as creative_name,
        page_link,
        template_page_link,
        url_tags,
        asset_feed_spec_link_urls,
        object_story_link_data_child_attachments,
        object_story_link_data_caption, 
        object_story_link_data_description, 
        object_story_link_data_link, 
        object_story_link_data_message,
        template_app_link_spec_ios,
        template_app_link_spec_ipad,
        template_app_link_spec_android,
        template_app_link_spec_iphone,
        row_number() over (partition by id order by _fivetran_synced desc) = 1 as is_most_recent_record
    from fields
)

select * 
from final