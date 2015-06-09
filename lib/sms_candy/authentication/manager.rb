module SmsCandy

  module Authentication

    class Manager

      class << self

        def access_token
          access_token = nil
          SmsCandy::Authentication::Strategies.list.each do |label, strategy|
            if (strategy.expires_at && strategy.expires_at < Time.zone.now)
              access_token = strategy.access_token
              return
            end
          end

          strategy = SmsCandy::Authentication::Strategies.list[:oauth2]
          strategy.authenticate! if strategy
        end

      end

    end

  end

end
