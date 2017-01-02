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
  puts params
  twiml = '<Response><Message>Hello from your Sinatra app!</Message></Response>'
  halt 200, twiml
end

