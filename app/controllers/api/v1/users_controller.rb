# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  
  def facebook
    res = ::ChoseProvider.new(provider,get_token)

    private
    
    def get_token(token)
      user_data = JSON.parse(@getdata) 
    end

  end
end
