require 'spec_helper'

RSpec.describe SmsCandy::Helpers::GetMessageStatusHelper do

  include CommonMethods

  let(:subject) { SmsCandy::Helpers::GetMessageStatusHelper }

  it "should respond to status" do
    expect(subject).to respond_to(:status)
  end

  it "should return correct status" do
    access_token = authenticate
    message_id = send_sms(access_token)
    expect(subject.status(message_id, access_token)).not_to  be_nil
  end

  it "should contain correct message details" do
    access_token = authenticate
    message_id = send_sms(access_token)
    response_hash = subject.status(message_id, access_token)

    expect(response_hash).to include(:to)
    expect(response_hash).to include(:received_timestamp)
    expect(response_hash).to include(:sent_timestamp)
    expect(response_hash).to include(:status)
  end

end
