describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect(test_vote.valid?).to eq(false)
      end
    end
  end
end
