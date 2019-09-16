require 'json'
require 'net/https'

URL_BASE   = "https://graph.facebook.com/me?"  	
  
APP_ID     = "471280757047696"
APP_SECRET = "7d813d9f75e24c51e1846237dce1d58d"

class Api::V1::UsersController < ApplicationController
  def initialize
    @token = get_token
  end 
  def get_token
    begin
      uri = URI.parse("https://graph.facebook.com/oauth/access_token")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      res = http.request(Net::HTTP::Get.new("#{uri.request_uri}?client_id=#{APP_ID}&client_secret=#{APP_SECRET}&grant_type=client_credentials"))
      res=JSON.parse(res.body)
      return res.slice("access_token").values.join("")
    rescue => e
      STDERR.puts "[ERROR][#{self.class.name}.get_token] #{e}"
      exit 1
      end
    end

    def facebook
        uri = URI.parse(URL_BASE)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        res = http.request(Net::HTTP::Get.new("#{uri.request_uri}?access_token=#{@token}"))
        binding.pry
        contents = JSON.parse(res.body)
        puts JSON.pretty_generate(contents)
        json_response "Information", true, {contents: contents}, :ok
    end
  end