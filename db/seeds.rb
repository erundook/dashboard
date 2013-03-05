# Team Members

5.times do
  TeamMember.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    title: Faker::Name.title,
    hired_at: Time.now-((5..30).to_a.sample).month,
    email: Faker::Internet.email,
    nickname: Faker::Internet.user_name
  )
end

# Sources

Source.create(
  name: 'Twitter',
  source_type: 'twitter',
  preferences: {
    api_keys: {
      consumer_key: ENV['TWITTER_CONSUMER_KEY'],
      consumer_secret: ENV['TWITTER_CONSUMER_SECRET'],
      oauth_token: ENV['TWITTER_OAUTH_TOKEN'],
      oauth_secret: ENV['TWITTER_OAUTH_TOKEN_SECRET']
    },
    query: {
      handle: '@tonycoco'
    }
  }
)

Source.create(
  name: 'Twitter',
  source_type: 'twitter',
  preferences: {
    api_keys: {
      consumer_key: ENV['TWITTER_CONSUMER_KEY'],
      consumer_secret: ENV['TWITTER_CONSUMER_SECRET'],
      oauth_token: ENV['TWITTER_OAUTH_TOKEN'],
      oauth_secret: ENV['TWITTER_OAUTH_TOKEN_SECRET']
    },
    query: {
      search: 'devmynd'
    }
  }
)

# Stories

Source.all.each do |source|
  source.fetch_updates
end
