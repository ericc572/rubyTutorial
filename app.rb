# app.rb
require "sinatra"
require 'sinatra/activerecord'
require 'json'
require './config/environments' #database configuration
require './models/model'

get '/' do
  erb:index
end

post '/create' do
  "Created a user"
end
