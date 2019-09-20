# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  # before_action :choose_provider
  # def choose_provider
  #   uri = URI.parse(ENV['URL_BASE'])
  #   # http = Net::HTTP.new(uri.host, uri.port)
  #   # http.use_ssl = true
  #   # http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  #   if return unless uri.host == 'graph.facebook.com'
  #     @provider = 'facebook'
  #     @getdata = ::GetFacebookData.new.get_facebook_data(uri).body
  #     if uri.host == 'twitter'
  #       @provider = 'twitter'
  #       @getdata = @getdata = ::GetTwitterData.new.get_twitter_data(uri).body
  #     else
  #       @provider = 'unnown'
  #     end
  #   end
  # end

  def facebook
    ::GetFacebookData.new(get_token)

    def get_token(token)
      user_data = JSON.parse(@getdata) 
    end


    # user_data = JSON.parse(@getdata)
    # user = User.find_by email: user_data['email']
    # user_identity = Identity.find_by uid: user_data['id']


  #   if user_identity
  #     User.find_by uid: user_data['id'].generate_new_authentication_token
  #     json_response 'User Information', true, { user: (User.find_by uid: user_data['id']) }, :ok
  #   else
  #     if (user = User.find_by email: user_data['email'])
  #       ::RegistrationIdentityTable.create_identity_user(user, user_data, @provider)
  #       authentication_token = User.generate_unique_secure_token
  #       json_response "Login #{@provider} Successfully", true, { user: user }, :ok
  #     else
  #       user = ::RegistrationUserProvider.new(user_data, @provider)
  #       authentication_token = User.generate_unique_secure_token
  #       json_response "Login #{@provider} Successfully", true, { user: user }, :ok
  #       if user.save
  #         json_response "Login #{@provider} Successfully", true, { user: user }, :ok
  #       else
  #         json_response user.errors, false, {}, :unprocessable_entity
  #       end
  #   end
  # end
  end
end
