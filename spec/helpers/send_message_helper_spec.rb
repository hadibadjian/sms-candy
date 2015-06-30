require 'spec_helper'

RSpec.describe SmsCandy::Helpers::SendMessageHelper do

  include CommonMethods

  let(:subject) { SmsCandy::Helpers::SendMessageHelper }
  let(:access_token) { authenticate }

  it "should respond to send_sms" do
    expect(subject).to respond_to(:send_sms)
  end

  it "should succeed with correct number" do
    expect(send_sms("0400000000", access_token)).not_to be_nil
  end

  it "should fail with bad number" do
    expect { send_sms("040000000x", access_token) }.to raise_error
  end

end
