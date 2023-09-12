

  create or replace view `convz-connectors`.`drops_ads_platform_test_linkedin_ads_source`.`stg_linkedin_ads__ad_analytics_by_campaign_tmp`
  OPTIONS()
  as 

select * 
from `convz-connectors`.`linkedin_ads`.`ad_analytics_by_campaign`;

