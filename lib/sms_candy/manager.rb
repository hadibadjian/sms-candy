module SmsCandy

  class Manager

    class << self

      def send_sms(number, message)
        SmsCandy::Helpers::MessageDelivery.send_sms(number, message)
      end

      def message_status(message_id)
        SmsCandy::Helpers::MessageDelivery.status(message_id)
      end

      def message_response(message_id)
        SmsCandy::Helpers::MessageDelivery.response(message_id)
      end

      def message_callback(message)
        SmsCandy::Helpers::MessageCallbackRendererHelper.render(message)
      end

    end

  end

end
