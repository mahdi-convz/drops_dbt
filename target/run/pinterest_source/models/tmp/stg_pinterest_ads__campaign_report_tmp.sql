

  create or replace view `convz-connectors`.`drops_ads_platform_test_pinterest_source`.`stg_pinterest_ads__campaign_report_tmp`
  OPTIONS()
  as 

select * 
from `convz-connectors`.`pinterest_ads`.`campaign_report`;

