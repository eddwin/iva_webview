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

  API_BASE_URI = 'https://iva-api.herokuapp.com/'
  API_VER = '/api/v1/'

  helpers do
    def api_url(resource)
        URI.join(API_BASE_URI, API_VER, resource).to_s
    end
  end


  get '/' do
    haml :index
  end

  get '/mostrar_fechas' do
    request_url = api_url("fechas")
    result = HTTParty.get(request_url)
    dates = JSON.parse(result)
    logger.info dates
    '
    <h2> Fechas de presentación de documentos </h2>
    <ul>
      <li>' + "Ultimo dia de IVA es: #{dates[0]} </li>
      <li>" + "Ultimo dia de pago a cuenta es: #{dates[2]} </li>
      </ul>"
  end

  get '/suscripcion' do
    'No funciono aun :)'
  end

end
