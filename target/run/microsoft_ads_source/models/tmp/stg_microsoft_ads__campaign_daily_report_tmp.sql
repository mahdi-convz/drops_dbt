

  create or replace view `convz-connectors`.`drops_ads_platform_test_microsoft_ads_source`.`stg_microsoft_ads__campaign_daily_report_tmp`
  OPTIONS()
  as 

select * 
from `convz-connectors`.`bingads`.`campaign_performance_daily_report`;

