# app.rb
require "sinatra"
require 'json'

class App < Sinatra::Base
  get "/" do
    erb :index
  end

  post "/moods" do
    puts params
    keyword = params["keyword"]
    @price = Prices.search_prices(keyword)
    erb :views
  end
end
