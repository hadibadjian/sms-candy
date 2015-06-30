module CommonMethods

  def authenticate
    SmsCandy::Authentication::Strategies::OAuth2.new.authenticate!
  end

  def send_sms(number = "0400000000", access_token)
    SmsCandy::Helpers::SendMessageHelper.send_sms(number, "Lorem ipsum", access_token)
  end

  def message_callback
    "{\"messageId\":\"E89196B793D930B4\", \"status\":\"READ\", \"acknowledgedTimestamp\":\"2014-10-26T23:10:00+11:00\", \"content\":\"Some response\"}"
  end

end

