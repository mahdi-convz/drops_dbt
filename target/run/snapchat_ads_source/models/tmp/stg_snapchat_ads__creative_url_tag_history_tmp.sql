

  create or replace view `drops-bi`.`marketing_full_v2_snapchat_ads_source`.`stg_snapchat_ads__creative_url_tag_history_tmp`
  OPTIONS()
  as 

select *
from `drops-bi`.`drops_snapchat_ads_full`.`creative_url_tag_history`;

