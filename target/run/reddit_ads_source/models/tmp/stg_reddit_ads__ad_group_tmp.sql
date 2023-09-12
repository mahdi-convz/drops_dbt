

  create or replace view `convz-connectors`.`drops_ads_platform_test_reddit_ads_source`.`stg_reddit_ads__ad_group_tmp`
  OPTIONS()
  as 

select *
from `convz-connectors`.`reddit_ads`.`ad_group`;

