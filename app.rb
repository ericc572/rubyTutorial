# app.rb
require "sinatra"
require 'json'
require 'net/http'

url = "https://api.coinbase.com/v2/prices/BTC-USD/spot"
uri = URI.parse(URI.encode(url))
api_response = Net::HTTP.get(uri)
response = JSON.parse(api_response)
price = response["data"]["amount"]

class App < Sinatra::Base
  get "/" do
    @price = params[:price]
    erb :index
  end
end
