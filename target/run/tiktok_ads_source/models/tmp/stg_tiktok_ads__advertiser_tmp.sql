

  create or replace view `drops-bi`.`marketing_full_v2_stg_tiktok_ads`.`stg_tiktok_ads__advertiser_tmp`
  OPTIONS()
  as 

select *
from `drops-bi`.`drops_tiktok_ads_full`.`advertiser`;

