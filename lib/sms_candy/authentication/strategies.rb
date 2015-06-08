module SmsCandy

  module Authentication

    module Strategies

      class << self

        def add(label, strategy = nil)
          strategy ||= SmsCandy::Authentication::Strategies::OAuth2.new

          unless strategy.class.method_defined?(:authenticate!)
            raise NoMethodError, "authenticate! is not declared in the #{label.inspect} strategy"
          end

          strategies[label] = strategy
        end

        def clear!
          strategies.clear
        end

        def strategies
          @strategies ||= {}
        end

      end

    end

  end

end
