require 'json'
require 'net/https'


class GetFacebookData
 
  

  def get_facebook_data(uri)
    @token = "EAAGsoJodAZAABAMoobX5Y70TahMNlUEPIaw8jFg27kWX1ZBRhSQAF7NLIYcQRlNRHwwsceDLyaOBDptPr4pAKflfOyTSGZCmIn3QakZAzZCFeRXZBDC4FK6YnIpNcZBl5VrTZB0Ldt1HZA4FI55efELXSV9pvJlGvhNZB2zdAf1Rry4bxUDeqtVa9rqiZC4gsRmIDeQ6WzABLpiqQZDZD"

    # uri = URI.parse(ENV['URL_BASE'])
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    # binding.pry
    res = http.request(Net::HTTP::Get.new("#{uri.request_uri}?access_token=#{@token}&fields=id,name,email"))
    # binding.pry
  end
end
