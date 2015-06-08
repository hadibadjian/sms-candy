ENV["RAILS_ENV"] = "test"

require 'simplecov'

require File.expand_path("../../spec/dummy/config/environment.rb",  __FILE__)
require 'sms_candy'
require 'helpers/common_methods'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.warnings = true
  config.order = :random
  Kernel.srand config.seed
end
