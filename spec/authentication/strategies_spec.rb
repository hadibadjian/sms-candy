require 'spec_helper'

RSpec.describe SmsCandy::Authentication::Strategies do

  let(:subject) { SmsCandy::Authentication::Strategies }
  let(:strategy) { SmsCandy::Authentication::Strategies::OAuth2.new }

  after(:each) do
    SmsCandy::Authentication::Strategies.clear!
  end

  it "should add new strategies" do
    expect(subject.add :oauth2, strategy).to eql(strategy)
  end

  it "should be able to clear strategies" do
    subject.add :oauth2, strategy
    expect(subject.clear!).to eql({})
  end

end
