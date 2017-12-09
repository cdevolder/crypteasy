require 'twilio-ruby'

account_sid = "AC20ce19122a60321c188fb3bfe4ec98b5" # Your Account SID from www.twilio.com/console
auth_token = "f6eaca786614a05a18fb503c1793a224"   # Your Auth Token from www.twilio.com/console

begin
  @client = Twilio::REST::Client.new account_sid, auth_token
  message = @client.messages.create(
      body: "Hello from Ruby",
      to: "+33635551536",    # Replace with your phone number
      from: "+33644640637")  # Replace with your Twilio number

rescue Twilio::REST::TwilioError => e
  puts e.message

end
