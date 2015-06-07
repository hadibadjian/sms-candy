require 'spec_helper'

RSpec.describe SmsCandy::Manager do

  let(:subject) { SmsCandy::Manager }

  it "should respond to send_sms" do
    expect(subject).to respond_to(:send_sms)
  end

  context "send SMS" do

    context "authenticated" do

      let(:send_sms) { subject.send_sms("0400000000", "lorem ipsum") }

      before(:each) do
        SmsCandy::Authentication::Strategies.add :oauth2, SmsCandy::Authentication::Strategies::OAuth2
      end

      after(:each) do
        SmsCandy::Authentication::Strategies.clear!
      end

      it "should return the message id" do
        expect(send_sms).not_to be_nil
      end

      it "should track send messages" do
        send_sms
        expect(subject.message_ids.count).to eql(1)
      end

    end

  end

end
