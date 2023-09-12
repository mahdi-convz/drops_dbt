
  
    

    create or replace table `drops-bi`.`marketing_full_v2_twitter_ads_source`.`stg_twitter_ads__tweet_url`
      
    
    

    OPTIONS()
    as (
      

with source as (

    select *
    from `drops-bi`.`marketing_full_v2_twitter_ads_source`.`stg_twitter_ads__tweet_url_tmp`

),

fields as (

    select
    
        
    
    
    display_url
    
 as 
    
    display_url
    
, 
    
    
    expanded_url
    
 as 
    
    expanded_url
    
, 
    
    
    index
    
 as 
    
    index
    
, 
    
    
    indices
    
 as 
    
    indices
    
, 
    
    
    tweet_id
    
 as 
    
    tweet_id
    
, 
    
    
    url
    
 as 
    
    url
    




    from source

), 

final as (

    select
        display_url,
        expanded_url,
        index,
        indices,
        tweet_id,
        url,
        

  
    split(
        expanded_url,
        '?'
        )[safe_offset(0)]
  

 as base_url,
        
    safe_cast(

  
    split(
        

  
    split(
        

    replace(
        

    replace(
        

    replace(
        expanded_url,
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
        expanded_url,
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
        expanded_url,
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
        expanded_url,
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
        expanded_url,
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
        expanded_url,
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
        expanded_url,
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
        expanded_url,
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
        expanded_url,
        'utm_source='
        )[safe_offset(1)]
  

,
        '&'
        )[safe_offset(0)]
  

,'') as utm_source,
        nullif(

  
    split(
        

  
    split(
        expanded_url,
        'utm_medium='
        )[safe_offset(1)]
  

,
        '&'
        )[safe_offset(0)]
  

,'') as utm_medium,
        nullif(

  
    split(
        

  
    split(
        expanded_url,
        'utm_campaign='
        )[safe_offset(1)]
  

,
        '&'
        )[safe_offset(0)]
  

,'') as utm_campaign,
        nullif(

  
    split(
        

  
    split(
        expanded_url,
        'utm_content='
        )[safe_offset(1)]
  

,
        '&'
        )[safe_offset(0)]
  

,'') as utm_content,
        nullif(

  
    split(
        

  
    split(
        expanded_url,
        'utm_term='
        )[safe_offset(1)]
  

,
        '&'
        )[safe_offset(0)]
  

,'') as utm_term
    
    from fields

)

select * from final
    );
  