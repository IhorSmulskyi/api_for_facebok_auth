require 'json'
require 'net/https'


class GetFacebookData
  def initialize
    @token = "EAAGsoJodAZAABADO9SmUK8SGnfZBKCexMh3pB57u1fq1nJN0tizxH0MveRp3F7PUpiVUM4A5Ks4eCpQ57MmZCnDxFCiFyf0HvDKfjO41l6XpgMVXaFgyZAi6ufsozTzG2MyhibH3Q7njFLOJgOYuZAfFM9cE6rkHKyMFE7YzF2Ht619G5QwdjT4WZBEZAUOVZBxKrAlsRqSXngZDZD"
  end 

  def get_facebook_data
    uri = URI.parse(ENV['URL_BASE'])
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    res = http.request(Net::HTTP::Get.new("#{uri.request_uri}?access_token=#{@token}"))
    # contents = JSON.parse(res.body)
    # puts JSON.pretty_generate(contents)
  end
end
