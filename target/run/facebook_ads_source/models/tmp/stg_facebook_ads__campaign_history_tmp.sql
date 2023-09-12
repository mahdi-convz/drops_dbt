

  create or replace view `drops-bi`.`marketing_facebook_ads_source`.`stg_facebook_ads__campaign_history_tmp`
  OPTIONS()
  as 

select * 
from `drops-bi`.`drops_facebook_ads`.`campaign_history`;

