module SalonVar
  if Rails.env == 'development'
    DOMAIN = "lvh.me"
    HOST = "lvh.me:3001"
    FACEBOOK_CLIENT_ID = "158898764228823"
    FACEBOOK_CLIENT_SECRET = "ecd21b911fd24afd52b4b40cf67684bb"
    FACEBOOK_SCOPE = "user_about_me,user_activities,user_birthday,user_education_history,user_events,user_groups,user_hometown,user_interests,user_likes,user_location,user_notes,user_online_presence,user_photo_video_tags,user_photos,user_relationships,user_relationship_details,user_religion_politics,user_status,user_videos,user_website,user_work_history,email,read_friendlists,read_insights,read_mailbox,read_requests,read_stream,xmpp_login,ads_management,user_checkins,publish_stream,create_event,rsvp_event,sms,offline_access,publish_checkins,manage_pages,friends_about_me,friends_activities,friends_birthday,friends_education_history,friends_events,friends_groups,friends_hometown,friends_interests,friends_likes,friends_location,friends_notes,friends_online_presence,friends_photo_video_tags,friends_photos,friends_relationships,friends_relationship_details,friends_religion_politics,friends_status,friends_videos,friends_website,friends_work_history,manage_friendlists,friends_checkins,manage_notifications"
  elsif Rails.env == 'test'
    DOMAIN = "test.com"
    HOST = "lvh.me:3001"
    FACEBOOK_CLIENT_ID = "158898764228823"
    FACEBOOK_CLIENT_SECRET = "ecd21b911fd24afd52b4b40cf67684bb"
    FACEBOOK_SCOPE = "user_about_me,user_activities,user_birthday,user_education_history,user_events,user_groups,user_hometown,user_interests,user_likes,user_location,user_notes,user_online_presence,user_photo_video_tags,user_photos,user_relationships,user_relationship_details,user_religion_politics,user_status,user_videos,user_website,user_work_history,email,read_friendlists,read_insights,read_mailbox,read_requests,read_stream,xmpp_login,ads_management,user_checkins,publish_stream,create_event,rsvp_event,sms,offline_access,publish_checkins,manage_pages,friends_about_me,friends_activities,friends_birthday,friends_education_history,friends_events,friends_groups,friends_hometown,friends_interests,friends_likes,friends_location,friends_notes,friends_online_presence,friends_photo_video_tags,friends_photos,friends_relationships,friends_relationship_details,friends_religion_politics,friends_status,friends_videos,friends_website,friends_work_history,manage_friendlists,friends_checkins,manage_notifications"
  else
    DOMAIN = "merrycreation.com"
    HOST = "merrycreation.com"
    FACEBOOK_CLIENT_ID = "175076642604675"
    FACEBOOK_CLIENT_SECRET = "71888ffd6df1cdab3374ae9ab88df940"
    FACEBOOK_SCOPE = "user_about_me,user_activities,user_birthday,user_education_history,user_events,user_groups,user_hometown,user_interests,user_likes,user_location,user_notes,user_online_presence,user_photo_video_tags,user_photos,user_relationships,user_relationship_details,user_religion_politics,user_status,user_videos,user_website,user_work_history,email,read_friendlists,read_insights,read_mailbox,read_requests,read_stream,xmpp_login,ads_management,user_checkins,publish_stream,create_event,rsvp_event,sms,offline_access,publish_checkins,manage_pages,friends_about_me,friends_activities,friends_birthday,friends_education_history,friends_events,friends_groups,friends_hometown,friends_interests,friends_likes,friends_location,friends_notes,friends_online_presence,friends_photo_video_tags,friends_photos,friends_relationships,friends_relationship_details,friends_religion_politics,friends_status,friends_videos,friends_website,friends_work_history,manage_friendlists,friends_checkins,manage_notifications"
  end
end