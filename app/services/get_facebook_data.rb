require 'json'
require 'net/https'


class GetFacebookData
  def initialize
    @token = "EAAGsoJodAZAABANjG5agw0fJ70MWudZCVxdz45hLIq8sj2sZCvhKeyB0wHD9e3EEHWZApZAlZAp63znMT7u3tONgdbY6TpsLufDq0Ajwjr0w7lLiznDDSCPfyGz8KqYoU1ZBu0czloaC9k1yUhvoS2W3flcE9G1rkA81wrTNlQlV8NTcQw6QcVkaFk6ZBg5omXEZD"
  end 

  def get_facebook_data
    uri = URI.parse(ENV['URL_BASE'])
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    res = http.request(Net::HTTP::Get.new("#{uri.request_uri}?access_token=#{@token}&fields=id,name,email"))
  end
end
