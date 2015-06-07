module SmsCandy

  class Manager

    class << self
      attr_accessor :message_ids

      # * Recipient number should be in the format of "04xxxxxxxx" where x is a digit
      # * Authorization header value should be in the format of "Bearer xxx" where xxx is access token returned
      #   from a previous GET https://api.telstra.com/v1/oauth/token request.
      # RECIPIENT_NUMBER=your_number
      # TOKEN=your_token

      # curl -H "Content-Type: application/json" \
      # -H "Authorization: Bearer $TOKEN" \
      # -d "{\"to\":\"$RECIPIENT_NUMBER\", \"body\":\"Hello!\"}" \
      # "https://api.telstra.com/v1/sms/messages"
      def send_sms(number, message)
        headers =  {
          "authorization" => "Bearer ",
          "Content-Type"  => "application/json",
          "Accept"        => "application/json"
        }
        data = { to: number, body: message }.to_json

        response = RestClient.post("https://staging.api.telstra.com/v1/sms/messages", data, headers)
        message_id = JSON.parse(response)['messageId']
        _message_ids.push message_id
        message_id
      rescue RestClient::BadRequest => e
        p e
      end

      private

        def _message_ids
          @message_ids ||= []
        end

    end

  end

end
