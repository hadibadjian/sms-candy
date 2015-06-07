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
          response = HTTParty.get(base_url, {
            "query": {
              "client_id": ENV["TELSTRA_SMS_CLIENT_ID"],
              "client_secret": ENV["TELSTRA_SMS_CLIENT_SECRET"],
              "grant_type": ENV["TELSTRA_SMS_GRANT_TYPE"],
              "scope": ENV["TELSTRA_SMS_SCOPE"]
            }
          })

          json_response = JSON.parse response.body
          @access_token = json_response["access_token"]
          @expires_at = Time.zone.now + json_response["expires_in"].to_i
        end

        private

          def base_url
            Rails.env.test? ?
              "https://staging.api.telstra.com/v1/oauth/token" :
              "https://api.telstra.com/v1/oauth/token"
          end
      end

    end

  end

end
