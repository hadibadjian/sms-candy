require 'rest_client'
require 'sms_candy/config'
require 'sms_candy/authentication/strategies'
require 'sms_candy/helpers/message_delivery'
require 'sms_candy/helpers/send_message_helper'
require 'sms_candy/helpers/get_message_status_helper'
require 'sms_candy/helpers/get_message_response_helper'
require 'sms_candy/helpers/message_callback_renderer_helper'
require 'sms_candy/manager'

module SmsCandy
  module Authentication
    module Strategies
      autoload :OAuth2, 'sms_candy/authentication/strategies/o_auth_2'
    end
  end
end
