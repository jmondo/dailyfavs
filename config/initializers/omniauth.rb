Rails.application.config.middleware.use OmniAuth::Builder do
  provider(:twitter,
    configatron.twitter_key || ENV['TWITTER_KEY'],
    configatron.twitter_secret || ENV['TWITTER_SECRET'])
end
