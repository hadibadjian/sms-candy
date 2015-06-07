require 'spec_helper'

RSpec.describe SmsCandy::Authentication::Strategies::OAuth2 do

  let(:subject) { SmsCandy::Authentication::Strategies::OAuth2.new }

  it "should respond to authentication_hash" do
    expect(subject).to respond_to(:access_token)
  end

  it "should respond to expires_at" do
    expect(subject).to respond_to(:expires_at)
  end

  it "should respond to refresh_token" do
    expect(subject).to respond_to(:authenticate!)
  end

  context "refresh token with correct credentials" do

    before(:each) do
      subject.authenticate!
    end

    it "should get valid access_token" do
      p subject.access_token
      expect(subject.access_token).not_to be_nil
    end

    it "should set expires_at" do
      expect(subject.expires_at).not_to be_nil
    end

  end

end
