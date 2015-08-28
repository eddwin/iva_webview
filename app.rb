require 'sinatra/base'
require 'json'
require 'httparty'
require 'sinatra/flash'

class IvaWebView < Sinatra::Base
  enable :sessions
    register Sinatra::Flash
    use Rack::MethodOverride

    configure :production, :development do
      enable :logging
    end

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
