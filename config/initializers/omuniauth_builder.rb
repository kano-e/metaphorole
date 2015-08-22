Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,
    Rails.application.secrets.facebook_app_id,
    Rails.application.secrets.facebook_app_secret,
    image_size: 'large'
  provider :twitter,
    Rails.application.secrets.twitter_api_key,
    Rails.application.secrets.twitter_api_secret,
    image_size: 'bigger'
end
