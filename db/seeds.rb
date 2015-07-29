# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Jim Admin",
             email: "jim@jim.com",
             password:              "jimmish",
             password_confirmation: "jimmish",
             image_url: "JimsLabFace.jpg",
             admin: true,
             confirmed_at: Time.zone.now)
User.create!(name:  "Tim Admin",
             email: "tim@tim.com",
             password:              "timmish",
             password_confirmation: "timmish",
             image_url: "ab.jpg",
             admin: true,
             confirmed_at: Time.zone.now)

user_index=(1..13).to_a.shuffle
user_index.each do |n|
  name  = Faker::Name.name
  email = Faker::Internet.email
  user=User.create(name: name ,
                  email: email ,
                  password:              'password' ,
                  password_confirmation: 'password' ,
                  image_url: Faker::Avatar.image,
                  confirmed_at: Time.zone.now)
end