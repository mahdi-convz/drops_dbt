

  create or replace view `convz-connectors`.`drops_ads_platform_test_microsoft_ads_source`.`stg_microsoft_ads__account_history_tmp`
  OPTIONS()
  as 

select * 
from `convz-connectors`.`bingads`.`account_history`;

