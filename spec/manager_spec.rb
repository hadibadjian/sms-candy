require 'spec_helper'

RSpec.describe SmsCandy::Manager do

  include CommonMethods

  let(:subject) { SmsCandy::Manager }

  it "should respond to send_sms" do
    expect(subject).to respond_to(:send_sms)
  end

  it "should respond to message_status" do
    expect(subject).to respond_to(:message_status)
  end

  it "should respond to message_response" do
    expect(subject).to respond_to(:message_response)
  end

  context "send sms" do

    it "should return message id" do
      expect(subject.send_sms("0400000000", "Lorem ipsum")).not_to be_nil
    end

  end

  context "message status" do

    it "should return message details" do
      message_id = send_sms
      expect(subject.message_status(message_id)).not_to be_nil
    end

  end

  context "message response" do

    it "should return message response" do
      message_id = send_sms
      expect(subject.message_response(message_id)).not_to be_nil
    end

  end

  context "message response callbacks" do

    it "should render response callbacks" do
      message = message_callback
      expect(subject.message_callback(message)).not_to be_nil
    end

  end

end
