

  create or replace view `convz-connectors`.`drops_ads_platform_test_reddit_ads_source`.`stg_reddit_ads__campaign_tmp`
  OPTIONS()
  as 

select *
from `convz-connectors`.`reddit_ads`.`campaign`;

