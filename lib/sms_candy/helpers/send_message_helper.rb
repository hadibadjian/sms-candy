module SmsCandy

  module Helpers

    class SendMessageHelper

      class << self

        # * Recipient number should be in the format of "04xxxxxxxx" where x is a digit
        # * Authorization header value should be in the format of "Bearer xxx" where xxx is access token returned
        #   from a previous GET https://api.telstra.com/v1/oauth/token request.
        # RECIPIENT_NUMBER=your_number
        # TOKEN=your_token

        # curl -H "Content-Type: application/json" \
        # -H "Authorization: Bearer $TOKEN" \
        # -d "{\"to\":\"$RECIPIENT_NUMBER\", \"body\":\"Hello!\"}" \
        # "https://api.telstra.com/v1/sms/messages"
        def send_sms(number, message, access_token)
          headers =  {
            "authorization" => "Bearer #{access_token}",
            "Content-Type"  => "application/json",
            "Accept"        => "application/json"
          }
          data = { to: number, body: message }.to_json

          response = RestClient.post(_base_url, data, headers)
          JSON.parse(response)['messageId']
        end

        private

          def _base_url
            SmsCandy::Config.base_url + "sms/messages"
          end

      end

    end

  end

end
