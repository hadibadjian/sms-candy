require 'spec_helper'

RSpec.describe SmsCandy::Config do

  let(:subject) { SmsCandy::Config }

  it "should respond to base_url" do
    expect(subject).to respond_to(:base_url)
  end

  it "base_url should have default values" do
    expect(subject.base_url).not_to be_nil
  end

end
