require 'json'
require 'net/http'

class Prices
  # the code in this class is responsible for 
  # - sending an HTTP request to the Giphy API
  # - looking at the data that gets sent back from that API and organizing it
  attr_accessor :value

  def initialize(url)
    self.value = value
  end

  def self.search_prices(keyword)
    url = "https://api.coinbase.com/v2/prices/#{keyword}-USD/spot"
    response = self.get_api_response(url)
    value = response["data"]["amount"]
  end

  def self.get_api_response(endpoint)
    uri = URI.parse(URI.encode(endpoint))
    api_response = Net::HTTP.get(uri)
    JSON.parse(api_response)
  end

end
