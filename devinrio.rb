require 'rubygems'
require 'sinatra'
require 'parseexcel'

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

get '/certificado' do
  workbook = Spreadsheet::ParseExcel.parse('public/files/LISTA_COMPLETA.xls')
  sheet = workbook.worksheet(0)

  certificate_for = nil

  i = 1
  sheet.each do
    id = sheet.cell(i,0).to_i
    name = sheet.cell(i,1).to_s('UTF8').split(' ').map {|w| w.capitalize }.join(' ')
    ip = sheet.cell(i,3).to_s('UTF8')
    present = sheet.cell(i,6).to_s('UTF8')

    certificate_for = name if present == "Sim" && id == params[:id].to_i && ip == params[:ip].to_s

    break if certificate_for

    i += 1
  end

  unless certificate_for.to_s.empty?
    erb :certificado, :locals => { :certificate_for => certificate_for }
  else
    erb :error
  end
end

get '/imprensa' do
  erb :imprensa
end

get '/press' do
  erb :imprensa_en
end

get '/sorteios' do
  erb :sorteios
end

get '/palestras' do
  erb :palestras
end

