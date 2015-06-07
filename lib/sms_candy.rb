require 'rest_client'
require 'sms_candy/authentication/strategies'
require 'sms_candy/manager'

module SmsCandy
  module Authentication
    module Strategies
      autoload :OAuth2, 'sms_candy/authentication/strategies/o_auth_2'
    end
  end
end
