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
end
