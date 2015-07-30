# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# restaurant = Restaurant.create!(name: "McDonald's")
# restaurant.logo = Rails.root.join("db/images/mcdonalds_logo.png").open
# restaurant.save!

user = User.create!(name:  "Jim Admin",
             email: "jim@jim.com",
             password:              "jimmish",
             password_confirmation: "jimmish",
             admin: true,
             confirmed_at: Time.zone.now)
user.image = Rails.root.join("db/images/JimsLabFace.jpg").open
user.save!


user = User.create!(name:  "Tim Admin",
             email: "tim@tim.com",
             password:              "timmish",
             password_confirmation: "timmish",
             admin: true,
             confirmed_at: Time.zone.now)
user.image = Rails.root.join("db/images/ab.jpg").open
user.save!


(1..13).to_a.shuffle.each do |n|
  name  = Faker::Name.name
  email = Faker::Internet.email
  user = User.create!(name: name ,
              email: email ,
              password:              'password' ,
              password_confirmation: 'password' ,
              confirmed_at: Time.zone.now)
  img = "face#{rand(1..10)}.JPG"
  user.image = Rails.root.join("db/images/"+img).open
  user.save!
end