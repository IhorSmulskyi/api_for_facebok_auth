class ChoseProvider
  def provider(provider, user_data)
  case provider
  when 'facebook'
    facebook_data = ::GetFacebookData.new.get_facebook_data(uri).body
    CheckIdentity.new(facebook_data)
  when 'twitter'
    twitter_data = ::GetTwitterData.new.get_twitter_data(uri).body
    CheckIdentity.new(twitter_data)
  else
    puts 'No provider'
  end
end
end
