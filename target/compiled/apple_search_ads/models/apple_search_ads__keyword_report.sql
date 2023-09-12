

with report as (

    select *
    from `drops-bi`.`marketing_full_v2_apple_search_ads_source`.`stg_apple_search_ads__keyword_report`
), 

keyword as (

    select *
    from `drops-bi`.`marketing_full_v2_apple_search_ads_source`.`stg_apple_search_ads__keyword_history`
    where is_most_recent_record = True
), 

ad_group as (

    select *
    from `drops-bi`.`marketing_full_v2_apple_search_ads_source`.`stg_apple_search_ads__ad_group_history`
    where is_most_recent_record = True
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
        ad_group.ad_group_id,
        ad_group.ad_group_name,
        keyword.keyword_id,
        keyword.keyword_text,
        keyword.match_type,
        report.currency,
        keyword.keyword_status,
        sum(report.taps) as taps,
        sum(report.new_downloads) as new_downloads,
        sum(report.redownloads) as redownloads,
        sum(report.new_downloads + report.redownloads) as total_downloads,
        sum(report.impressions) as impressions,
        sum(report.spend) as spend

        




    from report
    join keyword 
        on report.keyword_id = keyword.keyword_id
    join ad_group 
        on keyword.ad_group_id = ad_group.ad_group_id
    join campaign 
        on ad_group.campaign_id = campaign.campaign_id
    join organization 
        on ad_group.organization_id = organization.organization_id
    group by 1,2,3,4,5,6,7,8,9,10,11,12
)

select * 
from joined