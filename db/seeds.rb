# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file .env file.

@user = FactoryGirl.create(:user)
# User.create(name: Faker::Name.name, email: Faker::Internet.email, address: "Wooftown, Wisconsin", password: "password")

 # description: Faker::Hacker.say_something_smart, price: rand(1..100)) }

3.times {@user.dogs << FactoryGirl.create(:dog)}
 # Dog.create(name: Faker::Name.name, breed: "Wolf", date_of_birth: Date.new)