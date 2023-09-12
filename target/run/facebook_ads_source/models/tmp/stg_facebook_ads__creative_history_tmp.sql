

  create or replace view `drops-bi`.`marketing_facebook_ads_source`.`stg_facebook_ads__creative_history_tmp`
  OPTIONS()
  as 

select * 
from `drops-bi`.`drops_facebook_ads`.`creative_history`;

