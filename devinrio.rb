require 'rubygems'
require 'sinatra'

configure :production do
end

get '/' do
  erb :index
end

get '/sala2' do
  erb :index, :locals => { :sala => 2 }
end

get '/en' do
  erb :index_en
end

get '/track-b' do
  erb :index_en, :locals => { :sala => 2 }
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

get '/imprensa' do
  erb :imprensa
end

get '/press' do
  erb :imprensa_en
end
