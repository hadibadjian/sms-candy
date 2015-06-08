require 'spec_helper'

RSpec.describe SmsCandy::Helpers::GetMessageResponseHelper do

  include CommonMethods

  let(:subject) { SmsCandy::Helpers::GetMessageResponseHelper }

  it "should respond to response" do
    expect(subject).to respond_to(:response)
  end

  it "should return correct response format" do
    access_token = authenticate
    message_id = send_sms(access_token)
    response_hash = subject.response(message_id, access_token).first

    expect(response_hash).to include(:from)
    expect(response_hash).to include(:acknowledged_timestamp)
    expect(response_hash).to include(:content)
  end

end
