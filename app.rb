# app.rb
require "sinatra"
require 'json'
require 'net/http'



class App < Sinatra::Base
  get "/" do
    url = "https://api.coinbase.com/v2/prices/BTC-USD/spot"
    uri = URI.parse(URI.encode(url))
    api_response = Net::HTTP.get(uri)
    response = JSON.parse(api_response)
    @price = response["data"]["amount"]
    erb :index
  end
end
