

  create or replace view `convz-connectors`.`drops_ads_platform_test_amazon_ads_source`.`stg_amazon_ads__campaign_history_tmp`
  OPTIONS()
  as 

select * 
from `convz-connectors`.`amazon_ads`.`campaign_history`;

