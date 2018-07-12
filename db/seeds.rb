# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "admin",
             email: "admin@email.com",
             password: "password",
             password_confirmation: "password",
             admin: true)

User.create!(name: "steven",
             email: "steven@email.com",
             password: "12345steven",
             password_confirmation: "12345steven",
             admin: false)

10.times do |n|
  name  = Faker::SwordArtOnline.game_name
  email = "example-#{n+1}@email.com"
  password = "password"
  information = Faker::WorldOfWarcraft.hero
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               introduction: information)
end

users = User.all
user  = users.first
following = users[2..8]
followers = users[3..9]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }