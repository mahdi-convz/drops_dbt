

  create or replace view `drops-bi`.`marketing_full_v2_apple_search_ads_source`.`stg_apple_search_ads__ad_history_tmp`
  OPTIONS()
  as 

select * 
from `drops-bi`.`drops_apple_search_ads_full`.`ad_history`;

