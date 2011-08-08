require 'rubygems'
require 'sinatra'
require 'parseexcel'
require 'cgi'

configure :production do
end

get '/' do
  title = "Sábado - 29 de outubro - Hotel Guanabara - Rio de Janeiro - "
  erb :index, :locals => { :title => title }
end

get '/localizacao' do
  title = "Localização - "
  erb :localizacao, :locals => { :title => title }
end

get '/2009' do
  erb :"anteriores/site_2009", :layout => false
end

get '/2010' do
  erb :"anteriores/site_2010", :layout => false
end

get '/2010-en' do
  erb :"anteriores/site_2010_en", :layout => false
end

get '/certificado' do
  title = "Certificado de 2010 - "
  
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
    erb :certificado, :layout => false, :locals => { :certificate_for => certificate_for }
  else
    erb :error, :locals => { :title => title }
  end
end