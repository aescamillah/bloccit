require 'rails_helper'

describe User do

  include TestFactories

  describe "#favorited(post)" do

      before do
        @post = associated_post
        @user = authenticated_user(email_favorites: true)
        @user_2 = authenticated_user(email_favorites: true)
        @fav = Favorite.new(post_id: @post.id, user_id: @user_2.id)
        @fav.save
      end

      it "returns `nil` if the user has not favorited the post" do
        expect(@user.favorited(@post)).to eq(nil)
      end

      it "returns the appropriate favorite if it exists" do
        expect(@user_2.favorited(@post)).to eq(@fav)
      end

  end

  describe ".top_rated" do

    before do
      @user1 = create(:user)
      post = create(:post, user: @user1)
      create(:comment, user: @user1, post: post)

      @user2 = create(:user)
      post = create(:post, user: @user2)
      2.times { create(:comment, user: @user2, post: post) }
    end

    it "returns users ordered by comments + posts" do
      expect( User.top_rated ).to eq([@user2, @user1])
    end

    it "stores a `posts_count` on user" do
      users = User.top_rated
      expect( users.first.posts_count ).to eq(1)
    end

    it "stores a `comments_count` on user" do
      users = User.top_rated
      expect( users.first.comments_count ).to eq(2)
    end

  end

end
