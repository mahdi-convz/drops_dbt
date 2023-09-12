
  
    

    create or replace table `drops-bi`.`marketing_full_v2_apple_search_ads`.`apple_search_ads__campaign_report`
      
    
    

    OPTIONS()
    as (
      

with report as (
    
    select *
    from `drops-bi`.`marketing_full_v2_apple_search_ads_source`.`stg_apple_search_ads__campaign_report`

), 

campaign as (

    select *
    from `drops-bi`.`marketing_full_v2_apple_search_ads_source`.`stg_apple_search_ads__campaign_history`
    where is_most_recent_record = True
), 

organization as (

    select * 
    from `drops-bi`.`marketing_full_v2_apple_search_ads_source`.`stg_apple_search_ads__organization`

), 

joined as (

    select 
        report.date_day,
        campaign.organization_id,
        organization.organization_name,
        campaign.campaign_id, 
        campaign.campaign_name, 
        report.currency,
        campaign.campaign_status,
        campaign.start_at,
        campaign.end_at,
        sum(report.taps) as taps,
        sum(report.new_downloads) as new_downloads,
        sum(report.redownloads) as redownloads,
        sum(report.new_downloads + report.redownloads) as total_downloads,
        sum(report.impressions) as impressions,
        sum(report.spend) as spend

        




    from report
    join campaign 
        on report.campaign_id = campaign.campaign_id
    join organization 
        on campaign.organization_id = organization.organization_id
    group by 1,2,3,4,5,6,7,8,9
)

select * 
from joined
    );
  