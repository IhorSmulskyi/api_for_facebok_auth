require 'json'
require 'net/https'

class GetTwitterData
  def initialize
    @token = "EAAGsoJodAZAABAPGkgarDkHc2f6p3jp3fNk7Hfm17SqZBuoyXmNZBcsmAW3ex1QIFkKQpOJnh2fGGZBZBb3ZBtowNR7PxbIhXXTE8fnIboH7ZB4N7kfRXczELLP1RYRlJVaBCC8YjrKVA0eguDZCLXBbbzZCIfMnlgRZB8mf53ffmSUh7z2ejjlxS4KSDA2s8TYMgZD"
  end 

  def get_twitter_data(uri)
    res = http.request(Net::HTTP::Get.new("#{uri.request_uri}?access_token=#{@token}&fields=id,name,email"))
  end
end
