shared_examples_for "an authentication strategy" do
  let(:strategy) { described_class.new }

  context "interface" do

    it "should respond to authenticate!" do
      expect(strategy).to respond_to(:authenticate!)
    end

    it "should have access_token reader" do
      expect(strategy).to respond_to(:access_token)
    end

    it "should have expires_at reader" do
      expect(strategy).to respond_to(:expires_at)
    end

    it "should not have access_token writer" do
      expect {
        strategy.access_token = ""
      }.to raise_error
    end

    it "should not have expires_at writer" do
      expect {
        strategy.expires_at = Time.zone.now
      }.to raise_error
    end

  end

end
