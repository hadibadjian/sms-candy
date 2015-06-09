require 'spec_helper'

RSpec.describe SmsCandy::Helpers::GetMessageResponseHelper do

  include CommonMethods

  let(:subject) { SmsCandy::Helpers::GetMessageResponseHelper }

  it "should respond to response" do
    expect(subject).to respond_to(:response)
  end

end
