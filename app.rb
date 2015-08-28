require 'sinatra/base'
require 'json'
require 'httparty'

class IvaWebView < Sinatra::Base


  get '/' do
    "Hello There :)"
  end

  get '/mostrar_fechas' do
    dates = get_dates
    '<ul>
      <li>' + "Ultimo dia de IVA es: #{dates[0]} </li>
      <li>" + "Ultimo dia de pago a cuenta es: #{dates[1]} </li>
      </ul>"
  end


end
