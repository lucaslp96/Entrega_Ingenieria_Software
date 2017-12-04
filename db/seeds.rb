Permit.destroy_all
User.destroy_all
Answer.destroy_all
Question.destroy_all
Tag.destroy_all
University.destroy_all

Permit.create(action: "create_question_answer", required_points: 1)
Permit.create(action: "vote_pos_question_answer_comment", required_points: 15)
Permit.create(action: "comment_anywhere", required_points: 20)
Permit.create(action: "vote_negative", required_points: 100)
Permit.create(action: "admin_tags", required_points: 300)
Permit.create(action: "admin_universities", required_points: 500)
Permit.create(action: "modify_contents", required_points: 1000)

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

user1 = User.create(name: "Juan", email: "Juan@example.com", password: "user123")
user2 = User.create(name: "Augusto", email: "Augusto@example.com", password: "user123")
user3 = User.create(name: "Lucas", email: "Lucas@example.com", password: "user123")
user4 = User.create(name: "Pedro", email: "Pedro@example.com", password: "user123")
user5 = User.create(name: "Santiago", email: "Santiago@example.com", password: "user123")
user6 = User.create(name: "Seba", email: "Seba@example.com", password: "user123")

question1 = Question.create(title: "¿como derivar 5x?", numanswers: 0, content: "hola, como derivo esto?", user: user1, votes: 409, visits: 40, tags: [tag1,tag2])
question2 = Question.create(title: "¿integral de 34e^x?", numanswers: 2, content: "hola, me cuesta integrar", user: user2, votes: 300, visits: 4520, tags: [tag3])
question3 = Question.create(title: "¿las ballenas azules?", numanswers: 2, content: "hola, tengo una duda sobre las ballenas", user: user1, votes: 20, visits: 0, tags: [tag4, tag5])
question4 = Question.create(title: "¿metabolismo de los perros?", numanswers: 4, content: "hola, quiero saber mas sobre los perros", user: user4, votes: 156, visits: 0, tags: [tag2])
question5 = Question.create(title: "¿acordes de 7ma?", numanswers: 0, content: "hola, que son estos acordes?", user: user3, votes: 0, visits: 01, tags: [tag1,tag5])
question6 = Question.create(title: "¿modo mixolidio?", numanswers: 0, content: "buen dia, estaba leyendo sobre los modos griegos y...", user: user5, votes: 45, visits: 365, tags: [tag4])

answer1 = Answer.create(question_id: 2, votes: 0, user_id: 1, content: "yo usaria matlab y listo")
answer2 = Answer.create(question_id: 2, votes: 0, user_id: 1, content: "mejor busca el wolfram alpha que no lo tenes que bajar")
answer3 = Answer.create(question_id: 3, votes: 0, user_id: 2, content: "es un mito, algunas si otras no")
answer4 = Answer.create(question_id: 3, votes: 0, user_id: 6, content: "depende la especie de ballena")
answer5 = Answer.create(question_id: 4, votes: 0, user_id: 5, content: "no sabia que existia algo asi")
answer6 = Answer.create(question_id: 4, votes: 0, user_id: 3, content: "en el libro Grecia Antigua te lo explica con detalle")
answer7 = Answer.create(question_id: 4, votes: 0, user_id: 1, content: "se puede considerar interesante asldknasnfao")
answer8 = Answer.create(question_id: 4, votes: 0, user_id: 2, content: "los perros blablabla 7 años")

question_comment1 = QuestionComment.create(user_id: 1, question_id: 1, content: "podrias probar con la regla de la cadena")
question_comment2 = QuestionComment.create(user_id: 2, question_id: 1, content: "podrias usar un metodo numerico para aproximar")
question_comment3 = QuestionComment.create(user_id: 3, question_id: 1, content: "a mi me da 5 blablabla")
question_comment4 = QuestionComment.create(user_id: 4, question_id: 2, content: "se sabe que una exponencial es igual a snaosdia")
question_comment5 = QuestionComment.create(user_id: 5, question_id: 2, content: "tiene que darte lo mismo")
question_comment6 = QuestionComment.create(user_id: 6, question_id: 2, content: "creo que la integral no existe")

answer_comment1 = AnswerComment.create(user_id: 6, answer_id: 2, content: "comentando algo")
answer_comment2 = AnswerComment.create(user_id: 5, answer_id: 2, content: "por favor aclare")
answer_comment3 = AnswerComment.create(user_id: 6, answer_id: 3, content: "comentando algo")
answer_comment4 = AnswerComment.create(user_id: 5, answer_id: 3, content: "por favor aclare")
answer_comment5 = AnswerComment.create(user_id: 1, answer_id: 4, content: "comentando algo")
answer_comment6 = AnswerComment.create(user_id: 2, answer_id: 4, content: "por favor aclare")
