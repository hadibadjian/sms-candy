module SmsCandy

  module Helpers

    class MessageCallbackRendererHelper

      class << self

        def render(message)
          json_response = JSON.parse message
          json_response.map { |l,v| { l.underscore.to_sym => v } }.inject(:merge)
        end

      end

    end

  end

end
