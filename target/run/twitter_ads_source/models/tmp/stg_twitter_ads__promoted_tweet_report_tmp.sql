

  create or replace view `drops-bi`.`marketing_full_v2_twitter_ads_source`.`stg_twitter_ads__promoted_tweet_report_tmp`
  OPTIONS()
  as 

select *
from `drops-bi`.`drops_twitter_ads_full`.`promoted_tweet_report`;

