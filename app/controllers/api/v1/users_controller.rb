# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  before_action :choose_provider
  def choose_provider
    uri = URI.parse(ENV['URL_BASE'])
    # http = Net::HTTP.new(uri.host, uri.port)
    # http.use_ssl = true
    # http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    if uri.host == 'graph.facebook.com'
      @provider = 'facebook'
      @getdata = ::GetFacebookData.new.get_facebook_data(uri).body
      if uri.host == 'twitter'
        @provider = 'twitter'
        @getdata = @getdata = ::GetTwitterData.new.get_twitter_data(uri).body
      else
        @provider = 'unnown'
      end
    end
  end

  def facebook
    user_data = JSON.parse(@getdata)
    user = User.find_by email: user_data['email']
    binding.pry
    if user
      user.generate_new_authentication_token
      json_response 'User Information', true, { user: user }, :ok
    else
      user = ::RegistrationUseProvider.new(user_data, @provider)
      user.authentication_token = User.generate_unique_secure_token

      if user.save
        json_response 'Login Facebook Successfully', true, { user: user }, :ok
      else
        json_response user.errors, false, {}, :unprocessable_entity
      end
    end
  end
end
