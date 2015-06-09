require 'spec_helper'

RSpec.describe SmsCandy::Helpers::SendMessageHelper do

  include CommonMethods

  let(:subject) { SmsCandy::Helpers::SendMessageHelper }

  it "should respond to send_sms" do
    expect(subject).to respond_to(:send_sms)
  end

  it "should succeed with correct number" do
    expect(send_sms("0400000000")).not_to be_nil
  end

  it "should fail with bad number" do
    access_token = authenticate
    expect { send_sms("040000000x") }.to raise_error
  end

end
