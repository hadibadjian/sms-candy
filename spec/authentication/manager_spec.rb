require 'spec_helper'

RSpec.describe SmsCandy::Authentication::Manager do

  let(:subject) { SmsCandy::Authentication::Manager }

  it "should respond to access_token" do
    expect(subject).to respond_to(:access_token)
  end

  context "un-authenticated" do

    before(:each) do
      @strategy = SmsCandy::Authentication::Strategies::OAuth2.new
      SmsCandy::Authentication::Strategies.add :oauth2, @strategy
    end

    after(:each) do
      SmsCandy::Authentication::Strategies.clear!
    end

    it "should authenticate once" do
      expect(@strategy).to receive(:authenticate!)

      subject.access_token
      subject.access_token
    end

  end

end
