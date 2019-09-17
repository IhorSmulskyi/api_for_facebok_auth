class Api::V1::UsersController < ApplicationController

   def facebook
    getdata = ::GetFacebookData.new
    contents = JSON.parse(getdata.get_facebook_data.body)
    json_response "Information", true, {contents: contents}, :ok
  end

end