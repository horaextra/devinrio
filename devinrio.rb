require 'rubygems'
require 'sinatra'

configure :production do
end

get '/' do
  erb :index
end

