module SmsCandy

  module Helpers

    class GetMessageStatusHelper

      class << self

        # * MESSAGE_ID value is the value returned from a previous POST https://api.telstra.com/v1/sms/messages call
        # * Authorization header value should be in the format of "Bearer xxx" where xxx is access token returned
        #   from a previous GET https://api.telstra.com/v1/oauth/token request.
        # MESSAGE_ID="6F0B6030D7309137"
        # TOKEN=your_token

        # curl -H "Authorization: Bearer $TOKEN" \
        # "https://api.telstra.com/v1/sms/messages/$MESSAGE_ID"
        def status(message_id, access_token)
          headers =  {
            "authorization" => "Bearer #{access_token}",
            "Accept"        => "application/json"
          }

          response = RestClient.get(_base_url(message_id), headers)
          json_response = JSON.parse response
          json_response.map { |l,v| { l.underscore.to_sym => v } }.inject(:merge)
        end

        private

          def _base_url(message_id)
            SmsCandy::Config.base_url + "sms/messages/#{message_id}"
          end

      end

    end

  end

end
