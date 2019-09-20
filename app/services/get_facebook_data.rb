# frozen_string_literal: true

require 'json'
require 'net/https'

class GetFacebookData
  def get_facebook_data(uri)
    @token = 'EAAGsoJodAZAABAIBvSUZC8GjnZC9Oknf6YtQZCnM174WvAGey0Ha3UQlYrHVT5DCHFlyIyj8WBx2ZAHb9wrwwl1bpKxs61draPtCmezOZAR5nnJZCYofvmtwNFVrzNa4WfXrLTeE9yVRmARwIsGJExqIEkIjv6WYfEsa2zCZAqyeZBV8nhDENHGoU7o44lgNh2LEZD'

    # uri = URI.parse(ENV['URL_BASE'])
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    # binding.pry
    res = http.request(Net::HTTP::Get.new("#{uri.request_uri}?access_token=#{@token}&fields=id,name,email"))
    # binding.pry
  end
end
