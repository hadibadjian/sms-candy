$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sms_candy/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sms_candy"
  s.version     = SmsCandy::VERSION
  s.authors     = ["Hadi Badjian"]
  s.email       = ["info@smscandy.com"]
  s.homepage    = "http://smscandy.com"
  s.summary     = "Basic gem for Telstra SMS API."
  s.description = "The sms_candy gem uses Telstra API to send SMS messages to Australian mobile phones. It also allows you to receive messages, check for message status and get the message responses."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency "rest-client"
end
