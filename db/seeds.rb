# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Lab.create!(name: "Conceptual Pysics, Phys 101", college: "Eatwick College")
Lab.create!(name: "Inroduction to Astronomy, Astr 201", college: "Manhattan College")
Lab.create!(name: "Basic Electronics, Phys XXX", college: "Fairleigh Dickinson University")


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
  img = "face#{rand(1..18)}.JPG"
  user.image = Rails.root.join("db/images/"+img).open
  
  lab = Lab.find(rand(1..3))
  user.user_labs.create(lab: lab)
  user.save!

end

