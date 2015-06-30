module SmsCandy

  class Manager

    class << self

      def authenticate
        access_token = nil
        SmsCandy::Authentication::Strategies.list.each do |label, strategy|
          access_token = strategy.authenticate!
          return access_token if access_token
        end
      end

      def send_sms(number, message, access_token)
        SmsCandy::Helpers::SendMessageHelper.send_sms(number, message, access_token)
      end

      def message_status(message_id, access_token)
        SmsCandy::Helpers::GetMessageStatusHelper.status(message_id, access_token)
      end

      def message_response(message_id, access_token)
        SmsCandy::Helpers::GetMessageResponseHelper.response(message_id, access_token)
      end

      def message_callback(message)
        SmsCandy::Helpers::MessageCallbackRendererHelper.render(message)
      end

    end

  end

end
