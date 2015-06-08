require 'spec_helper'

RSpec.describe SmsCandy::Helpers::MessageCallbackRendererHelper do

  include CommonMethods

  let(:subject) { SmsCandy::Helpers::MessageCallbackRendererHelper }

  it "should response to render" do
    expect(subject).to respond_to(:render)
  end

  it "should render message correctly" do
    response_hash = subject.render(message_callback)

    expect(response_hash).to include(:message_id)
    expect(response_hash).to include(:status)
    expect(response_hash).to include(:acknowledged_timestamp)
    expect(response_hash).to include(:content)
  end


end
