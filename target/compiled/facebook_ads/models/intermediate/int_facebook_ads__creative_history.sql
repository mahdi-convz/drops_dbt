



with base as (

    select *
    from `drops-bi`.`marketing_facebook_ads_source`.`stg_facebook_ads__creative_history`
    where is_most_recent_record = true

), 

url_tags as (

    select *
    from `drops-bi`.`marketing_facebook_ads`.`facebook_ads__url_tags`
), 

url_tags_pivoted as (

    select 
        _fivetran_id,
        creative_id,
        min(case when key = 'utm_source' then value end) as utm_source,
        min(case when key = 'utm_medium' then value end) as utm_medium,
        min(case when key = 'utm_campaign' then value end) as utm_campaign,
        min(case when key = 'utm_content' then value end) as utm_content,
        min(case when key = 'utm_term' then value end) as utm_term
    from url_tags
    group by 1,2

), 

fields as (

    select
        base._fivetran_id,
        base.creative_id,
        base.account_id,
        base.creative_name,
        coalesce(page_link,template_page_link) as url,
        

  
    split(
        coalesce(page_link,template_page_link),
        '?'
        )[safe_offset(0)]
  

 as base_url,
        
    safe_cast(

  
    split(
        

  
    split(
        

    replace(
        

    replace(
        

    replace(
        coalesce(page_link,template_page_link),
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
        coalesce(page_link,template_page_link),
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
        coalesce(page_link,template_page_link),
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
        coalesce(page_link,template_page_link),
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
        coalesce(page_link,template_page_link),
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
        coalesce(page_link,template_page_link),
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
        coalesce(page_link,template_page_link),
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
        coalesce(page_link,template_page_link),
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
        coalesce(url_tags_pivoted.utm_source, nullif(

  
    split(
        

  
    split(
        coalesce(page_link,template_page_link),
        'utm_source='
        )[safe_offset(1)]
  

,
        '&'
        )[safe_offset(0)]
  

,'')) as utm_source,
        coalesce(url_tags_pivoted.utm_medium, nullif(

  
    split(
        

  
    split(
        coalesce(page_link,template_page_link),
        'utm_medium='
        )[safe_offset(1)]
  

,
        '&'
        )[safe_offset(0)]
  

,'')) as utm_medium,
        coalesce(url_tags_pivoted.utm_campaign, nullif(

  
    split(
        

  
    split(
        coalesce(page_link,template_page_link),
        'utm_campaign='
        )[safe_offset(1)]
  

,
        '&'
        )[safe_offset(0)]
  

,'')) as utm_campaign,
        coalesce(url_tags_pivoted.utm_content, nullif(

  
    split(
        

  
    split(
        coalesce(page_link,template_page_link),
        'utm_content='
        )[safe_offset(1)]
  

,
        '&'
        )[safe_offset(0)]
  

,'')) as utm_content,
        coalesce(url_tags_pivoted.utm_term, nullif(

  
    split(
        

  
    split(
        coalesce(page_link,template_page_link),
        'utm_term='
        )[safe_offset(1)]
  

,
        '&'
        )[safe_offset(0)]
  

,'')) as utm_term
    from base
    left join url_tags_pivoted
        on base._fivetran_id = url_tags_pivoted._fivetran_id
        and base.creative_id = url_tags_pivoted.creative_id
)

select *
from fields