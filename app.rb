if ENV["RACK_ENV"] != "production"
  require('dotenv')
  Dotenv.load
end

require('sinatra')
require('twilio-ruby')

twilio_auth_token = ENV["TWILIO_AUTH_TOKEN"]
twilio_account_sid = ENV["TWILIO_ACCOUNT_SID"]

#@client = Twilio::REST::Client.new twilio_account_sid, twilio_auth_token

post '/sms' do
  content_type 'text/xml'
  twiml = '<Response><Message>' + params['Body'] + '</Message></Response>'
  halt 200, twiml
end

get '/webhook' do
  status 404
  return "Beeswax, None Of Yours Inc."
  halt 404, "Beeswax, None Of Yours Inc."
  if ENV["FB_VERIFY_TOKEN"] == params['hub.verify_token']
    halt 200, params['hub.challenge']
  else
    halt 404, "Beeswax, None Of Yours Inc."
  end
end

