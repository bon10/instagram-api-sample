Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :facebook, ENV['FACEBOOK_API_ID'], ENV['FACEBOOK_API_SECRET'],
    scope: 'public_profile,instagram_basic', display: 'popup',
    local: 'ja_JP', info_fields: "id"
end