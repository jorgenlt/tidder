# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

17.times do
  User.create(email: Faker::Internet.email, password: "123456", username: Faker::Internet.username(specifier: 5..8))
end

puts 'Users created.'

i = 1
17.times do
  Post.create(user_id: i, title: Faker::Quote.famous_last_words, content: Faker::Quote.matz)
  i += 1
end

puts 'Posts created.'

postid = 1
17.times do
  userid = 1
  7.times do
    Comment.create(user_id: userid, post_id: postid, content: Faker::Quote.matz)
    userid += 1
  end
  postid += 1
end

puts 'Comments created.'

# i = 1
# 10.times do
#   post = Post.find(i)
#   user = 1
#   10.times do
#     post.upvote_by User.find(user)
#     user += 1
#   end
#   i += 1
# end
