require 'spec_helper'

RSpec.describe SmsCandy::Manager do

  include CommonMethods

  let(:subject) { SmsCandy::Manager }
  let(:message_id) { subject.send_sms("0400000000", "Lorem ipsum", @access_token) }

  before(:all) do
    @access_token = authenticate
  end

  it "should respond to send_sms" do
    expect(subject).to respond_to(:send_sms)
  end

  it "should respond to message_status" do
    expect(subject).to respond_to(:message_status)
  end

  it "should respond to message_response" do
    expect(subject).to respond_to(:message_response)
  end

  it "should respond to authenticate" do
    expect(subject).to respond_to(:authenticate)
  end

  context "#authenticate" do

    before(:each) do
      SmsCandy::Authentication::Strategies.add :oauth2
    end

    it "should return authenticated access_token" do
      expect(subject.authenticate).not_to be_nil
    end

  end

  context "#send_sms" do

    it "should return message id" do
      expect(message_id).not_to be_nil
    end

  end

  context "#message_status" do

    it "should return message details" do
      expect(subject.message_status(message_id, @access_token)).not_to be_nil
    end

  end

  context "#message_response" do

    it "should return message response" do
      expect(subject.message_response(message_id, @access_token)).not_to be_nil
    end

  end

  context "#message_callback" do

    it "should render response callbacks" do
      message = message_callback
      expect(subject.message_callback(message)).not_to be_nil
    end

  end

end
