describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        user = User.create
        topic = Topic.create
        @post = Post.create(title: 'post title', body: 'Post bodies must be pretty long.')
        my_vote = @post.votes.create(value: 0)
        expect(my_vote.valid?).to eq(false)
      end
    end
  end
end
