
  
    

    create or replace table `drops-bi`.`marketing_full_v2_apple_search_ads`.`apple_search_ads__search_term_report`
      
    
    

    OPTIONS()
    as (
      

with report as (

    select *
    from `drops-bi`.`marketing_full_v2_apple_search_ads_source`.`stg_apple_search_ads__search_term_report`
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
        organization.organization_id,
        organization.organization_name,
        campaign.campaign_id, 
        campaign.campaign_name, 
        report.ad_group_id,
        report.ad_group_name,
        report.keyword_id,
        report.keyword_text,
        report.search_term_text,
        report.match_type,
        report.currency,
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
    where report.search_term_text is not null
    group by 1,2,3,4,5,6,7,8,9,10,11,12
)

select * 
from joined
    );
  