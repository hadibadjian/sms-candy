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
            SmsCandy::Authentication::Strategies.add(:oauth2) if SmsCandy::Authentication::Strategies.strategies.empty?

            access_token = nil
            SmsCandy::Authentication::Strategies.strategies.each { |l,s| access_token = s.access_token and return if s.access_token }

            access_token = SmsCandy::Authentication::Strategies.strategies.map { |l,s| s.authenticate! }.first if access_token.nil?
            access_token
          end

      end

    end

  end

end
