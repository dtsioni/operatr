Dotenv.load
twilio_auth_token = ENV["TWILIO_AUTH_TOKEN"]
twilio_account_sid = ENV["TWILIO_ACCOUNT_SID"]

@client = Twilio::REST::Client.new twilio_account_sid, twilio_auth_token

#@client.messages.create(
 # from: '+18622775064',
  #to: '+19738653323',
 # body: 'Hey there!'
#)

get '/' do
  'hello world'
end

