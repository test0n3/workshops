# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless User.any?
  User.create!(
    name: "Jon Snow",
    role: "member",
    email: "jon@snow.com",
    password: "password",
    password_confirmation: "password"
  )

  User.create!(
    name: "Daenerys Targaryen",
    role: "admin",
    email: "dany@t.com",
    password: "password",
    password_confirmation: "password"
  )

  User.create!(
    name: "Tyrion Lannister",
    role: "staff",
    email: "tyrion@lannister.com",
    password: "password",
    password_confirmation: "password"
  )
end

unless NewsArticle.any?
  NewsArticle.create(
    title: "First Article",
    author: "First Author",
    content: "Hi",
    category: "sports",
    published_at: Date.yesterday
  )

  NewsArticle.create(
    title: "Second Article",
    author: "Second Author",
    content: "San Francisco",
    category: "world-news",
    published_at: 3.days.ago
  )

  NewsArticle.create(
    title: "First Draft",
    author: "First Author",
    content: "Hello",
    category: "politics",
  )
end
