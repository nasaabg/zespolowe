# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
password = Faker::Internet.password
user1 = User.create!(email: Faker::Internet.email, password: password, password_confirmation: password, confirmed_at: Time.now, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, specialization: "Programmer", gender: "male")
user2 = User.create!(email: Faker::Internet.email, password: password, password_confirmation: password, confirmed_at: Time.now, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, specialization: "Programmer", gender: "male")
puts "Users created"

Question.destroy_all
question1 = Question.create!(title: Faker::Name.title, description: Faker::Hipster.paragraph(2), user: user1, tag_list: ["awesome", "ruby"])
question2 = Question.create!(title: Faker::Name.title, description: Faker::Hipster.paragraph(2), user: user2, tag_list: ["yolo", "project"])
puts "Questions created"

QuestionPoint.destroy_all
QuestionPoint.create!(user: user2, question: question1)
QuestionPoint.create!(user: user1, question: question2)
puts "Question points"

Answer.destroy_all
Answer.create!(question: question1, user: user2, is_accepted: true, body: Faker::Hipster.paragraph(2))
Answer.create!(question: question2, user: user1, is_accepted: true, body: Faker::Hipster.paragraph(2))
answer1 = Answer.create!(question: question1, user: user2, is_accepted: false)
puts "Answers created"

Comment.destroy_all
answer1.comments.create!(title: Faker::Name.title, comment: Faker::Hipster.paragraph(2), user: user1)
answer1.comments.create!(title: Faker::Name.title, comment: Faker::Hipster.paragraph(2), user: user2)
puts "Comments created"
