

  create or replace view `drops-bi`.`marketing_full_v2_twitter_ads_source`.`stg_twitter_ads__campaign_history_tmp`
  OPTIONS()
  as 

select *
from `drops-bi`.`drops_twitter_ads_full`.`campaign_history`;

