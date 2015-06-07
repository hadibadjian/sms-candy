module SmsCandy

  module Authentication

    module Strategies

      class << self
        def add(label, strategy = nil)
          strategy ||= Class.new(SmsCandy::Authentication::Strategies::OAuth2)

          unless strategy.method_defined?(:authenticate!)
            raise NoMethodError, "authenticate! is not declared in the #{label.inspect} strategy"
          end

          _strategies[label] = strategy
        end

        def clear!
          _strategies.clear
        end

        private
          def _strategies
            @strategies ||= {}
          end

      end

    end

  end

end
