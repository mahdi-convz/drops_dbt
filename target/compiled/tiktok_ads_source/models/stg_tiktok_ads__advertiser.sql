

with base as (

    select *
    from `drops-bi`.`marketing_full_v2_stg_tiktok_ads`.`stg_tiktok_ads__advertiser_tmp`
), 

fields as (

    select
        
    
    
    address
    
 as 
    
    address
    
, 
    
    
    balance
    
 as 
    
    balance
    
, 
    
    
    cellphone_number
    
 as 
    
    cellphone_number
    
, 
    
    
    company
    
 as 
    
    company
    
, 
    
    
    contacter
    
 as 
    
    contacter
    
, 
    
    
    country
    
 as 
    
    country
    
, 
    
    
    currency
    
 as 
    
    currency
    
, 
    
    
    description
    
 as 
    
    description
    
, 
    
    
    email
    
 as 
    
    email
    
, 
    
    
    id
    
 as 
    
    id
    
, 
    
    
    industry
    
 as 
    
    industry
    
, 
    
    
    language
    
 as 
    
    language
    
, 
    
    
    name
    
 as 
    
    name
    
, 
    cast(null as STRING) as 
    
    phone_number
    
 , 
    cast(null as STRING) as 
    
    telephone
    
 , 
    
    
    telephone_number
    
 as 
    
    telephone_number
    
, 
    
    
    timezone
    
 as 
    
    timezone
    




    from base
),

final as (

    select   
        id as advertiser_id, 
        address, 
        balance, 
        company, 
        contacter, 
        country, 
        currency, 
        description, 
        email, 
        industry, 
        language,
        name as advertiser_name, 
        coalesce(cellphone_number, phone_number) as cellphone_number, 
        coalesce(telephone_number, telephone) as telephone_number,
        timezone
    from fields
)

select *
from final