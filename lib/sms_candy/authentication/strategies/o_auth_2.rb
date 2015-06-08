module SmsCandy

  module Authentication

    module Strategies

      class OAuth2
        attr_accessor :access_token
        attr_accessor :expires_at

        #Obtain these keys from the Telstra Developer Portal
        # APP_KEY="yourapikey"
        # APP_SECRET="yourapisecret"

        # curl "https://api.telstra.com/v1/oauth/token?client_id=$APP_KEY&client_secret=$APP_SECRET&grant_type=client_credentials&scope=SMS"
        def authenticate!
          response = RestClient.get(base_url, { params: authentication_params })

          json_response = JSON.parse response.body
          @expires_at = Time.zone.now + json_response["expires_in"].to_i
          @access_token = json_response["access_token"]
        end

        private

          def authentication_params
            {
              client_id: ENV["TELSTRA_SMS_CLIENT_ID"],
              client_secret: ENV["TELSTRA_SMS_CLIENT_SECRET"],
              grant_type: ENV["TELSTRA_SMS_GRANT_TYPE"],
              scope: ENV["TELSTRA_SMS_SCOPE"]
            }
          end

          def base_url
            SmsCandy::Config.base_url + "oauth/token"
          end
      end

    end

  end

end
