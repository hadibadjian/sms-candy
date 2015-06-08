require 'spec_helper'

RSpec.describe SmsCandy::Helpers::MessageDelivery do

  let(:subject) { SmsCandy::Helpers::MessageDelivery }

  it "should respond to send_sms" do
    expect(subject).to respond_to(:send_sms)
  end

  it "should respond to status" do
    expect(subject).to respond_to(:status)
  end

  it "should respond to response" do
    expect(subject).to respond_to(:response)
  end

end
