

  create or replace view `convz-connectors`.`drops_ads_platform_test_linkedin_ads_source`.`stg_linkedin_ads__account_history_tmp`
  OPTIONS()
  as 

select *
from `convz-connectors`.`linkedin_ads`.`account_history`;

