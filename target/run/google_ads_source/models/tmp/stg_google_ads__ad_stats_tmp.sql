

  create or replace view `drops-bi`.`marketing_full_v2_google_ads_source`.`stg_google_ads__ad_stats_tmp`
  OPTIONS()
  as 

select * 
from `drops-bi`.`drops_google_ads_full`.`ad_stats`;

