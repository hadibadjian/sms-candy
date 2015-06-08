require 'spec_helper'

RSpec.describe SmsCandy::Helpers::SendMessageHelper do

  include CommonMethods

  let(:subject) { SmsCandy::Helpers::SendMessageHelper }

  it "should respond to send_sms" do
    expect(subject).to respond_to(:send_sms)
  end

  it "send_sms should return message id" do
    access_token = authenticate
    expect(send_sms(access_token)).not_to be_nil
  end

  it "should fail if bad access_token is provided" do
    access_token = "123"
    expect { send_sms(access_token) }.to raise_error(RestClient::Unauthorized)
  end

  it "should fail with bad number" do
    access_token = authenticate
    expect { send_sms(access_token, "040000000x") }.to raise_error(RestClient::BadRequest)
  end

end
