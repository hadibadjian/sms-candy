require 'spec_helper'

class InvalidStrategyWithoutAuthenticate
end

RSpec.describe SmsCandy::Authentication::Strategies do

  let(:subject) { SmsCandy::Authentication::Strategies }
  let(:strategy) { SmsCandy::Authentication::Strategies::OAuth2.new }

  after(:each) do
    SmsCandy::Authentication::Strategies.clear!
  end

  context "#add" do

    it "should add new strategies" do
      expect(subject.add :oauth2, strategy).to eql(strategy)
    end

    it "should fail adding a strategy without authenticate! method" do
      expect {
        subject.add :invalid_strategy, InvalidStrategyWithoutAuthenticate.new
      }.to raise_error
    end

  end

  context "#clear!" do

    it "should be able to clear strategies" do
      subject.add :oauth2, strategy
      expect(subject.clear!).to eql({})
    end

  end

end
