

  create or replace view `convz-connectors`.`drops_ads_platform_test_microsoft_ads_source`.`stg_microsoft_ads__search_daily_report_tmp`
  OPTIONS()
  as 

select * 
from `convz-connectors`.`bingads`.`search_query_performance_daily_report`;

