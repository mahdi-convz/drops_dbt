

  create or replace view `convz-connectors`.`drops_ads_platform_test_pinterest_source`.`stg_pinterest_ads__pin_promotion_history_tmp`
  OPTIONS()
  as 

select *
from `convz-connectors`.`pinterest_ads`.`pin_promotion_history`;

