# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Answer.destroy_all
Question.destroy_all
Tag.destroy_all

#emails distintos!, created at y uptadated at se ponen solos

tag1 = Tag.create :usos => 6, :content => "arquitectura"
tag2 = Tag.create :usos => 4, :content => "biologia"
tag3 = Tag.create :usos => 4, :content => "fisica"
tag4 = Tag.create :usos => 4, :content => "arqueologia"
tag5 = Tag.create :usos => 6, :content => "informatica"
tag6 = Tag.create :usos => 6, :content => "ingenieria"
tag7 = Tag.create :usos => 6, :content => "matematica"
tag8 = Tag.create :usos => 6, :content => "probabilidades"

user1 = User.create :name => "User1", :email => "user1@example.com", :password => "user123"
user2 = User.create :name => "User2", :email => "user2@example.com", :password => "user123"
user3 = User.create :name => "User3", :email => "user3@example.com", :password => "user123"
user4 = User.create :name => "User4", :email => "user4@example.com", :password => "user123"
user5 = User.create :name => "User5", :email => "user5@example.com", :password => "user123"
user6 = User.create :name => "User6", :email => "user6@example.com", :password => "user123"

question1 = Question.create :title => "pregunta 1?", :content => "hola, tengo una duda sobre algo", user: user1, :votes => 0, :visits => 0, :numanswers => 0, tags: [tag1,tag2]
question2 = Question.create :title => "pregunta 2?", :content => "hola, tengo una duda sobre algo", user: user2, :votes => 0, :visits => 0, :numanswers => 2, tags: [tag3]
question3 = Question.create :title => "pregunta 3?", :content => "hola, tengo una duda sobre algo", user: user1, :votes => 0, :visits => 0, :numanswers => 2, tags: [tag4, tag5]
question4 = Question.create :title => "pregunta 4?", :content => "hola, tengo una duda sobre algo", user: user4, :votes => 0, :visits => 0, :numanswers => 2, tags: [tag2]
question5 = Question.create :title => "pregunta 5?", :content => "hola, tengo una duda sobre algo", user: user3, :votes => 0, :visits => 0, :numanswers => 0, tags: [tag1,tag5]
question6 = Question.create :title => "pregunta 6?", :content => "hola, tengo una duda sobre algo", user: user5, :votes => 0, :visits => 0, :numanswers => 0, tags: [tag4]

answer1 = Answer.create :question_id => 2, :votes => 0, :user_id => 1, :content => "y mira yo que vos nose 1"
answer2 = Answer.create :question_id => 2, :votes => 0, :user_id => 1, :content => "y mira yo que vos nose 6"
answer3 = Answer.create :question_id => 3, :votes => 0, :user_id => 1, :content => "y mira yo que vos nose 2"
answer4 = Answer.create :question_id => 3, :votes => 0, :user_id => 6, :content => "y mira yo que vos nose 3"
answer5 = Answer.create :question_id => 4, :votes => 0, :user_id => 5, :content => "y mira yo que vos nose 4"
answer6 = Answer.create :question_id => 4, :votes => 0, :user_id => 3, :content => "y mira yo que vos nose 5"
