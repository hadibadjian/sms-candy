require 'spec_helper'
require 'authentication/strategies/strategy_behaviors'

RSpec.describe SmsCandy::Authentication::Strategies::OAuth2 do

  let(:subject) { SmsCandy::Authentication::Strategies::OAuth2.new }

  it_behaves_like "an authentication strategy"

end
