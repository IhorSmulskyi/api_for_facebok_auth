class Api::V1::UsersController < ApplicationController

   def facebook
    getdata = ::GetFacebookData.new
    user_data = JSON.parse(getdata.get_facebook_data.body)

    user = User.find_by email: user_data["email"]
    # binding.pry
    if user
      user.generate_new_authentication_token
      json_response "User Information", true, {user: user}, :ok
    else
      user = User.new(email: user_data["email"],
                      uid: user_data["id"],
                      provider: "facebook",
                      image: user_data["picture"]["data"]["url"],
                      password: Devise.friendly_token[0,20])
      # binding.pry
      user.authentication_token = User.generate_unique_secure_token

      if user.save
        json_response "Login Facebook Successfully", true, {user: user}, :ok
      else
        json_response user.errors, false, {}, :unprocessable_entity
      end
    end
    
   end

end