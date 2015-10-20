FactoryGirl.define do
  factory :post do
    title "Post Title"
    body "Post bodies must be pretty long."
    user
    topic { Topic.create(name: 'Topic name') }

    factory :post_with_comment do
      after(:create) do |post|
        create(:comment, post: post, user: post.user)
      end
    end
  end
end
