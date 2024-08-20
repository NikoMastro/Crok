require 'net/http'
require 'json'

class DogApiService
  API_URL = 'https://api.api-ninjas.com/v1/dogs'
  API_KEY = '9ZGP/UmUh1vqwEDBww+k4Q==RjWzpsacAaraPj4O'

  def self.call(breed)
    uri = URI("#{API_URL}?name=#{breed}")
    request = Net::HTTP::Get.new(uri)
    request['X-Api-Key'] = API_KEY

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end

    if response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body)
    else
      []
    end
  end
end
