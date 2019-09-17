require 'json'
require 'net/https'

URL_BASE   = "https://graph.facebook.com/v4.0/me"  	
  
APP_ID     = "471280757047696"
APP_SECRET = "7d813d9f75e24c51e1846237dce1d58d"

class Api::V1::UsersController < ApplicationController

  def initialize
    @token = "EAAGsoJodAZAABAOzhIWW8ZCUotizgs9Oflww0r3vbfk3ZATJCf9oeU7lDZA0Wl2vxqv3poLFvL5wnFGUSpAnvNwFZBsYba9ITyskm4RpN5jcBclh6RP6hCFttzobxp9mN7U9XvEIkeYAHSKvcfZAG9plxDwrpMV02ec18I277IsKNn4ks655cfP7z1AXu232MZD"
  end 
  def facebook
    uri = URI.parse(URL_BASE)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    res = http.request(Net::HTTP::Get.new("#{uri.request_uri}?access_token=#{@token}"))
    contents = JSON.parse(res.body)
    puts JSON.pretty_generate(contents)
    json_response "Information", true, {contents: contents}, :ok
  end
end