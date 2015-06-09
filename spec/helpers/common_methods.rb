module CommonMethods

  def authenticate
    SmsCandy::Authentication::Manager.access_token
  end

  def send_sms(number = "0400000000")
    SmsCandy::Helpers::MessageDelivery.send_sms(number, "Lorem ipsum")
  end

  def message_callback
    "{\"messageId\":\"E89196B793D930B4\", \"status\":\"READ\", \"acknowledgedTimestamp\":\"2014-10-26T23:10:00+11:00\", \"content\":\"Some response\"}"
  end

end

