require 'rubygems'
require 'sinatra'

configure :production do
end

get '/' do
  erb :index
end

get '/en' do
  erb :index_en
end

get '/2009' do
  erb :site_2009
end

get '/inscreva-se' do
  erb :inscricao
end

get '/boleto' do
  erb :boleto
end
