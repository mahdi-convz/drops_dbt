
  
    

    create or replace table `drops-bi`.`marketing_full_v2_google_ads_source`.`stg_google_ads__ad_history`
      
    
    

    OPTIONS()
    as (
      

with base as (

    select * 
    from `drops-bi`.`marketing_full_v2_google_ads_source`.`stg_google_ads__ad_history_tmp`
),

fields as (

    select
        
    
    
    ad_group_id
    
 as 
    
    ad_group_id
    
, 
    
    
    display_url
    
 as 
    
    display_url
    
, 
    
    
    final_urls
    
 as 
    
    final_urls
    
, 
    
    
    id
    
 as 
    
    id
    
, 
    
    
    name
    
 as 
    
    name
    
, 
    
    
    status
    
 as 
    
    status
    
, 
    
    
    type
    
 as 
    
    type
    
, 
    
    
    updated_at
    
 as 
    
    updated_at
    
, 
    
    
    _fivetran_active
    
 as 
    
    _fivetran_active
    



        
    from base
),

final as (
    
    select 
        cast(ad_group_id as STRING) as ad_group_id, 
        id as ad_id,
        name as ad_name,
        updated_at,
        type as ad_type,
        status as ad_status,
        display_url,
        final_urls as source_final_urls,
        replace(replace(final_urls, '[', ''),']','') as final_urls,
        row_number() over (partition by id, ad_group_id order by updated_at desc) = 1 as is_most_recent_record
    from fields
    where coalesce(_fivetran_active, true)
),

final_urls as (

    select 
        *,
        --Extract the first url within the list of urls provided within the final_urls field
        

  
    split(
        final_urls,
        ','
        )[safe_offset(0)]
  

 as final_url

    from final

),

url_fields as (
    select 
        *,
        

  
    split(
        final_url,
        '?'
        )[safe_offset(0)]
  

 as base_url,
        
    safe_cast(

  
    split(
        

  
    split(
        

    replace(
        

    replace(
        

    replace(
        final_url,
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
        final_url,
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
        final_url,
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
        final_url,
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
        final_url,
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
        final_url,
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
        final_url,
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
        final_url,
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
        final_url,
        'utm_source='
        )[safe_offset(1)]
  

,
        '&'
        )[safe_offset(0)]
  

,'') as utm_source,
        nullif(

  
    split(
        

  
    split(
        final_url,
        'utm_medium='
        )[safe_offset(1)]
  

,
        '&'
        )[safe_offset(0)]
  

,'') as utm_medium,
        nullif(

  
    split(
        

  
    split(
        final_url,
        'utm_campaign='
        )[safe_offset(1)]
  

,
        '&'
        )[safe_offset(0)]
  

,'') as utm_campaign,
        nullif(

  
    split(
        

  
    split(
        final_url,
        'utm_content='
        )[safe_offset(1)]
  

,
        '&'
        )[safe_offset(0)]
  

,'') as utm_content,
        nullif(

  
    split(
        

  
    split(
        final_url,
        'utm_term='
        )[safe_offset(1)]
  

,
        '&'
        )[safe_offset(0)]
  

,'') as utm_term
    from final_urls
)

select * 
from url_fields
    );
  