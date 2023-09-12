
  
    

    create or replace table `drops-bi`.`marketing_full_v2_ad_reporting`.`metricflow_time_spine`
      
    
    

    OPTIONS()
    as (
      
with 

days as (
    
    with date_spine as
(

    





with rawdata as (

    

    

    with p as (
        select 0 as generated_number union all select 1
    ), unioned as (

    select

    
    p0.generated_number * power(2, 0)
     + 
    
    p1.generated_number * power(2, 1)
     + 
    
    p2.generated_number * power(2, 2)
     + 
    
    p3.generated_number * power(2, 3)
     + 
    
    p4.generated_number * power(2, 4)
     + 
    
    p5.generated_number * power(2, 5)
     + 
    
    p6.generated_number * power(2, 6)
     + 
    
    p7.generated_number * power(2, 7)
     + 
    
    p8.generated_number * power(2, 8)
     + 
    
    p9.generated_number * power(2, 9)
     + 
    
    p10.generated_number * power(2, 10)
     + 
    
    p11.generated_number * power(2, 11)
    
    
    + 1
    as generated_number

    from

    
    p as p0
     cross join 
    
    p as p1
     cross join 
    
    p as p2
     cross join 
    
    p as p3
     cross join 
    
    p as p4
     cross join 
    
    p as p5
     cross join 
    
    p as p6
     cross join 
    
    p as p7
     cross join 
    
    p as p8
     cross join 
    
    p as p9
     cross join 
    
    p as p10
     cross join 
    
    p as p11
    
    

    )

    select *
    from unioned
    where generated_number <= 3651
    order by generated_number



),

all_periods as (

    select (
        

        datetime_add(
            cast( 

        datetime_add(
            cast( cast(timestamp(datetime(current_timestamp(), 'America/Los_Angeles')) as date) as datetime),
        interval -3650 day
        )

 as datetime),
        interval row_number() over (order by 1) - 1 day
        )


    ) as date_day
    from rawdata

),

filtered as (

    select *
    from all_periods
    where date_day <= cast(

        datetime_add(
            cast( cast(timestamp(datetime(current_timestamp(), 'America/Los_Angeles')) as date) as datetime),
        interval 1 day
        )

 as date)

)

select * from filtered



)
select
    cast(d.date_day as TIMESTAMP) as date_day
from
    date_spine d



),

cast_to_date as (

    select 
        cast(date_day as date) as date_day
    
    from days

)

select * from cast_to_date
    );
  