require 'rubygems'
require 'sinatra'
require 'parseexcel'
require 'cgi'

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

  i = 0
  sheet.each do
    name = sheet.cell(i,3).to_s('UTF8').split(' ').map {|w| w.capitalize }.join(' ')
    email = sheet.cell(i,4).to_s('UTF8').downcase
    present = sheet.cell(i,12).to_s('UTF8')

    certificate_for = name if present == "Sim" && email == CGI.unescape(params[:email]).to_s.downcase

    break unless certificate_for.to_s.empty?

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

get '/quero-o-meu-certificado' do
  erb :form_certificado
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

get '/heempreende' do
  erb :heempreende
end