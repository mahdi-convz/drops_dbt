
  
    

    create or replace table `drops-bi`.`marketing_full_v2_stg_tiktok_ads`.`stg_tiktok_ads__ad_history`
      
    
    

    OPTIONS()
    as (
      

with base as (

    select *
    from `drops-bi`.`marketing_full_v2_stg_tiktok_ads`.`stg_tiktok_ads__ad_history_tmp`
), 

fields as (

    select
        
    
    
    ad_id
    
 as 
    
    ad_id
    
, 
    
    
    ad_name
    
 as 
    
    ad_name
    
, 
    
    
    adgroup_id
    
 as 
    
    adgroup_id
    
, 
    
    
    advertiser_id
    
 as 
    
    advertiser_id
    
, 
    
    
    call_to_action
    
 as 
    
    call_to_action
    
, 
    
    
    campaign_id
    
 as 
    
    campaign_id
    
, 
    
    
    click_tracking_url
    
 as 
    
    click_tracking_url
    
, 
    
    
    impression_tracking_url
    
 as 
    
    impression_tracking_url
    
, 
    
    
    landing_page_url
    
 as 
    
    landing_page_url
    
, 
    
    
    updated_at
    
 as 
    
    updated_at
    




    from base
), 

final as (

    select  
        ad_id,
        cast(updated_at as TIMESTAMP) as updated_at,
        adgroup_id as ad_group_id,
        advertiser_id,
        campaign_id,
        ad_name,
        call_to_action,
        click_tracking_url,
        impression_tracking_url,
        

  
    split(
        landing_page_url,
        '?'
        )[safe_offset(0)]
  

 as base_url,
        
    safe_cast(

  
    split(
        

  
    split(
        

    replace(
        

    replace(
        

    replace(
        landing_page_url,
        'android-app://',
        ''
    )


,
        'http://',
        ''
    )


,
        'https://',
        ''
    )


,
        '/'
        )[safe_offset(0)]
  

,
        '?'
        )[safe_offset(0)]
  

 as STRING)
 as url_host,
        '/' || 
    safe_cast(

  
    split(
        

    case when 

    length(
        

    replace(
        

    replace(
        landing_page_url,
        'http://',
        ''
    )


,
        'https://',
        ''
    )



    )-coalesce(
            nullif(

    strpos(
        

    replace(
        

    replace(
        landing_page_url,
        'http://',
        ''
    )


,
        'https://',
        ''
    )


,
        '/'

    ), 0),
            

    strpos(
        

    replace(
        

    replace(
        landing_page_url,
        'http://',
        ''
    )


,
        'https://',
        ''
    )


,
        '?'

    ) - 1
            ) = 0
        then ''
    else
        substr(
            

    replace(
        

    replace(
        landing_page_url,
        'http://',
        ''
    )


,
        'https://',
        ''
    )


,
            -1 * (

    length(
        

    replace(
        

    replace(
        landing_page_url,
        'http://',
        ''
    )


,
        'https://',
        ''
    )



    )-coalesce(
            nullif(

    strpos(
        

    replace(
        

    replace(
        landing_page_url,
        'http://',
        ''
    )


,
        'https://',
        ''
    )


,
        '/'

    ), 0),
            

    strpos(
        

    replace(
        

    replace(
        landing_page_url,
        'http://',
        ''
    )


,
        'https://',
        ''
    )


,
        '?'

    ) - 1
            ))
        )
    end,
        '?'
        )[safe_offset(0)]
  

 as STRING)
 as url_path,
        nullif(

  
    split(
        

  
    split(
        landing_page_url,
        'utm_source='
        )[safe_offset(1)]
  

,
        '&'
        )[safe_offset(0)]
  

,'') as utm_source,
        nullif(

  
    split(
        

  
    split(
        landing_page_url,
        'utm_medium='
        )[safe_offset(1)]
  

,
        '&'
        )[safe_offset(0)]
  

,'') as utm_medium,
        nullif(

  
    split(
        

  
    split(
        landing_page_url,
        'utm_campaign='
        )[safe_offset(1)]
  

,
        '&'
        )[safe_offset(0)]
  

,'') as utm_campaign,
        nullif(

  
    split(
        

  
    split(
        landing_page_url,
        'utm_content='
        )[safe_offset(1)]
  

,
        '&'
        )[safe_offset(0)]
  

,'') as utm_content,
        nullif(

  
    split(
        

  
    split(
        landing_page_url,
        'utm_term='
        )[safe_offset(1)]
  

,
        '&'
        )[safe_offset(0)]
  

,'') as utm_term,
        landing_page_url,
        row_number() over (partition by ad_id order by updated_at desc) = 1 as is_most_recent_record
    from fields
)

select * 
from final
    );
  