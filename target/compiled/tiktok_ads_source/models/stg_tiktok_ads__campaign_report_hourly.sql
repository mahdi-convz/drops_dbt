

with base as (

    select *
    from `drops-bi`.`marketing_full_v2_stg_tiktok_ads`.`stg_tiktok_ads__campaign_report_hourly_tmp`
), 

fields as (

    select
        
    
    
    campaign_id
    
 as 
    
    campaign_id
    
, 
    
    
    average_video_play
    
 as 
    
    average_video_play
    
, 
    
    
    average_video_play_per_user
    
 as 
    
    average_video_play_per_user
    
, 
    
    
    clicks
    
 as 
    
    clicks
    
, 
    
    
    comments
    
 as 
    
    comments
    
, 
    
    
    conversion
    
 as 
    
    conversion
    
, 
    
    
    conversion_rate
    
 as 
    
    conversion_rate
    
, 
    
    
    cost_per_conversion
    
 as 
    
    cost_per_conversion
    
, 
    
    
    cpc
    
 as 
    
    cpc
    
, 
    
    
    cpm
    
 as 
    
    cpm
    
, 
    
    
    ctr
    
 as 
    
    ctr
    
, 
    
    
    follows
    
 as 
    
    follows
    
, 
    
    
    impressions
    
 as 
    
    impressions
    
, 
    
    
    likes
    
 as 
    
    likes
    
, 
    
    
    profile_visits
    
 as 
    
    profile_visits
    
, 
    
    
    reach
    
 as 
    
    reach
    
, 
    
    
    shares
    
 as 
    
    shares
    
, 
    
    
    spend
    
 as 
    
    spend
    
, 
    
    
    stat_time_hour
    
 as 
    
    stat_time_hour
    
, 
    
    
    video_play_actions
    
 as 
    
    video_play_actions
    
, 
    
    
    video_views_p_25
    
 as 
    
    video_views_p_25
    
, 
    
    
    video_views_p_50
    
 as 
    
    video_views_p_50
    
, 
    
    
    video_views_p_75
    
 as 
    
    video_views_p_75
    
, 
    
    
    video_watched_2_s
    
 as 
    
    video_watched_2_s
    
, 
    
    
    video_watched_6_s
    
 as 
    
    video_watched_6_s
    



    from base
), 

final as (

    select  
        campaign_id,
        cast(stat_time_hour as TIMESTAMP) as stat_time_hour,
        cpc, 
        cpm,
        ctr,
        impressions,
        clicks,
        spend,
        reach,
        conversion,
        cost_per_conversion,
        conversion_rate,
        likes,
        comments,
        shares,
        profile_visits,
        follows,
        video_play_actions,
        video_watched_2_s,
        video_watched_6_s,
        video_views_p_25,
        video_views_p_50,
        video_views_p_75,
        average_video_play,
        average_video_play_per_user

        




        
    from fields
)

select *
from final