require 'twilio-ruby'

class SendSmsService

  def initialize(number, body)
    @number = number
    @body = body
  end

  def send

    account_sid = ENV['TWILIO_ACCOUNT_SID'] # Your Account SID from www.twilio.com/console
    auth_token = ENV['TWILIO_AUTH_TOKEN']   # Your Auth Token from www.twilio.com/console

    begin
      @client = Twilio::REST::Client.new account_sid, auth_token
      message = @client.messages.create(
          body: "#{@body}",
          to: "+#{@number}",    # Replace with your phone number
          from: ENV['TWILIO_PHONE_NUMBER'])  # Replace with your Twilio number

    rescue Twilio::REST::TwilioError => e
      puts e.message

    end
  end

end
