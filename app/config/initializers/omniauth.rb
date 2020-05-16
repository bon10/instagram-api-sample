Rails.application.config.middleware.use OmniAuth::Builder do

  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'],
    scope: 'public_profile,instagram_basic,pages_show_list', display: 'popup',
    local: 'ja_JP'
end
