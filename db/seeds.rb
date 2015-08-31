require 'faker'

posts_index = 0
posts_flag = true
comments_index = 0
comments_flag = true

50.times do
  Post.create!(
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
  )
end
posts = Post.all

while posts_index < posts.length
  if (posts[posts_index].title == "Unique title") && (posts[posts_index].body == "Unique body")
    posts_flag = false
    break
  else
    posts_index += 1
  end
end

if posts_flag
  Post.create!(
    title:  "Unique title",
    body:   "Unique body"
  )  
end


100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

comments = Comment.all

while comments_index < comments.length
  if (comments[comments_index].body == "Unique comment")
    comments_flag = false
    break
  else
    comments_index += 1
  end
end

if comments_flag
  Comment.create!(
    post:  posts.sample,
    body:   "Unique comment"
  )  
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"