

  create or replace view `convz-connectors`.`drops_ads_platform_test_amazon_ads_source`.`stg_amazon_ads__portfolio_history_tmp`
  OPTIONS()
  as 

select * 
from `convz-connectors`.`amazon_ads`.`portfolio_history`;

