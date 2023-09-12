

  create or replace view `convz-connectors`.`drops_ads_platform_test_amazon_ads_source`.`stg_amazon_ads__advertised_product_report_tmp`
  OPTIONS()
  as 

select * 
from `convz-connectors`.`amazon_ads`.`advertised_product_report`;

