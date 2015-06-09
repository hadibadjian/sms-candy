module SmsCandy

  module Helpers

    class MessageDelivery

      class << self

        def send_sms(number, message)
          SmsCandy::Helpers::SendMessageHelper.send_sms(number, message, _access_token)
        end

        def status(message_id)
          SmsCandy::Helpers::GetMessageStatusHelper.status(message_id, _access_token)
        end

        def response(message_id)
          SmsCandy::Helpers::GetMessageResponseHelper.response(message_id, _access_token)
        end

        private

          def _access_token
            SmsCandy::Authentication::Manager.access_token
          end

      end

    end

  end

end
