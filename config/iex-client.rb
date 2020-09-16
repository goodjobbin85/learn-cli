# Config file for iex-ruby gem 
# gem dot-env

IEX::Api.configure do |config|
  config.publishable_token = 'Tpk_dd88c906f3ae4ac492644c2d0d82281d'  # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']
  config.endpoint = 'https://sandbox.iexapis.com/v1' # defaults to 'https://cloud.iexapis.com/v1'
end 

