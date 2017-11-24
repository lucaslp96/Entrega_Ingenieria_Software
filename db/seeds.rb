User.destroy_all
Answer.destroy_all
Question.destroy_all
Tag.destroy_all
University.destroy_all

uni1 = University.create(name: "UNLP")
uni2 = University.create(name: "UNRN")
uni3 = University.create(name: "UNC")
uni4 = University.create(name: "UNS")

tag1 = Tag.create(usos: 36, content: "ARQUITECTURA")
tag2 = Tag.create(usos: 54, content: "BIOLOGIA")
tag3 = Tag.create(usos: 04, content: "FISICA")
tag4 = Tag.create(usos: 19,content: "ARQUEOLOGIA")
tag5 = Tag.create(usos: 07, content: "INFORMATICA")
tag6 = Tag.create(usos: 06, content: "INGENIERIA")
tag7 = Tag.create(usos: 16, content: "MATEMATICA")
tag8 = Tag.create(usos: 42, content: "PROBABILIDADES")
tag9 = Tag.create(usos: 75, content: "ESTADISTICA")

#los usuarios deben tener emails distintos para no generar error

user1 = User.create(name: "User1", email: "user1@example.com", password: "user123")
user2 = User.create(name: "User2", email: "user2@example.com", password: "user123")
user3 = User.create(name: "User3", email: "user3@example.com", password: "user123")
user4 = User.create(name: "User4", email: "user4@example.com", password: "user123")
user5 = User.create(name: "User5", email: "user5@example.com", password: "user123")
user6 = User.create(name: "User6", email: "user6@example.com", password: "user123")

question1 = Question.create(title: "¿como derivar 5x?", content: "hola, tengo una duda sobre algo", user: user1, votes: 40, visits: 40, tags: [tag1,tag2])
question2 = Question.create(title: "¿integral de 34e^x?", content: "hola, tengo una duda sobre algo", user: user2, votes: 300, visits: 4520, tags: [tag3])
question3 = Question.create(title: "¿las ballenas azules?", content: "hola, tengo una duda sobre algo", user: user1, votes: 20, visits: 0, tags: [tag4, tag5])
question4 = Question.create(title: "¿metabolismo de los perros?", content: "hola, tengo una duda sobre algo", user: user4, votes: 156, visits: 0, tags: [tag2])
question5 = Question.create(title: "¿acordes de 7ma?", content: "hola, los intervaloslaksdank", user: user3, votes: 0, visits: 01, tags: [tag1,tag5])
question6 = Question.create(title: "¿modo mixolidio?", content: "buen dia, estaba leyendo sobre los modos griegos y...", user: user5, votes: 45, visits: 365, tags: [tag4])

answer1 = Answer.create(question_id: 2, user_id: 1, content: "y mira yo que vos nose 1")
answer2 = Answer.create(question_id: 2, user_id: 1, content: "y mira yo que vos nose 6")
answer3 = Answer.create(question_id: 3, user_id: 1, content: "y mira yo que vos nose 2")
answer4 = Answer.create(question_id: 3, user_id: 6, content: "y mira yo que vos nose 3")
answer5 = Answer.create(question_id: 4, user_id: 5, content: "y mira yo que vos nose 4")
answer6 = Answer.create(question_id: 4, user_id: 3, content: "y mira yo que vos nose 5")
