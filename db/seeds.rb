# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# require 'faker'

# 10.times do
#   Post.create(user_id: 1, title: "Lorem ipsum dolor", content: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Magnam optio adipisci, dolores illo quo quod quaerat laborum aliquam, temporibus voluptate officia hic quae, porro praesentium obcaecati. Voluptate optio ullam corrupti.")
#   puts "Post created"
# end

10.times do
  i = 1
  10.times do
    Comment.create(user_id: 2, post_id: i, content: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Magnam optio adipisci, dolores illo quo quod quaerat laborum aliquam, temporibus voluptate officia hic quae, porro praesentium obcaecati. Voluptate optio ullam corrupti.")
    i += 1
    puts "Comment created"
  end
end
