# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Kavish R Munjal",
             email: "kavish@twitter.org",
             handle: "kavisherlock",
             password: "kavish",
             password_confirmation: "kavish",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

49.times do |n|
  name  = Faker::Name.name
  email = "user-#{n+1}@twitter.org"
  handle = "user-#{n+1}"
  password = "kavish"
  User.create!(name:  name,
               email: email,
               handle: handle,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

users_tweet = User.order(:created_at).take(6)
25.times do
 content = Faker::Lorem.sentence(rand(2..10)).chomp('.')
 users_tweet.each { |user| user.tweets.create!(content: content) }

end
