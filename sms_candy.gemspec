$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sms_candy/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sms_candy"
  s.version     = SmsCandy::VERSION
  s.authors     = ["Hadi Badjian"]
  s.email       = ["contact@meancandy.com"]
  s.homepage    = "http://meancandy.com/sms"
  s.summary     = "Summary of SmsCandy."
  s.description = "Description of SmsCandy."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency "rest-client"
end
