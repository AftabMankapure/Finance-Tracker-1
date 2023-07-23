require 'alphavantage'
 
Alphavantage.configure do |config|
  config.api_key = 'Rails.application.credentials.alpha[:key_id]'
end