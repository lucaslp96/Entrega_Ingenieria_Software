Permit.destroy_all
User.destroy_all
Answer.destroy_all
Question.destroy_all
Tag.destroy_all
University.destroy_all

Permit.create(action: "crear preguntas y respuestas", required_points: 1)
Permit.create(action: "votar positivamente preguntas, respuestas y comentarios", required_points: 15)
Permit.create(action: "comentar en cualquier parte", required_points: 20)
Permit.create(action: "votar negativamente", required_points: 100)
Permit.create(action: "administrar etiquetas", required_points: 300)
Permit.create(action: "administrar universidades", required_points: 500)
Permit.create(action: "modificar contenido", required_points: 1000)

uni1 = University.create(name: "UNLP", question_uses: 5)
uni2 = University.create(name: "UNRN", question_uses: 2)
uni3 = University.create(name: "UNC", question_uses: 3)
uni4 = University.create(name: "UNS", question_uses: 1)
uni5 = University.create(name: "UTN", question_uses: 2)

tag1 = Tag.create(usos: 0, content: "Arquitectura")
tag2 = Tag.create(usos: 0, content: "Biologia")
tag3 = Tag.create(usos: 0, content: "Fisica")
tag4 = Tag.create(usos: 0, content: "Arqueologia")
tag5 = Tag.create(usos: 0, content: "Informatica")
tag6 = Tag.create(usos: 0, content: "Ingenieria")
tag7 = Tag.create(usos: 0, content: "Matematica")
tag8 = Tag.create(usos: 0, content: "Probabilidades")
tag9 = Tag.create(usos: 0, content: "Estadistica")
tag10 = Tag.create(usos: 0, content: "Medicina")

#los usuarios deben tener emails distintos para no generar error
#usuarios con puntos incoherentes para probar permisos

user1 = User.create(name: "Juan    ", email: "juan@example.com    ", password: "123456", points: 0002, university_id: uni1, tags: [tag4, tag9])
user2 = User.create(name: "Augusto ", email: "augusto@example.com ", password: "123456", points: 0016, university_id: uni2, tags: [tag4])
user3 = User.create(name: "Lucas   ", email: "lucas@example.com   ", password: "123456", points: 0030, university_id: uni3, tags: [tag1, tag2, tag3])
user4 = User.create(name: "Pedro   ", email: "pedro@example.com   ", password: "123456", points: 0110, university_id: uni4, tags: [tag8])
user5 = User.create(name: "Santiago", email: "santiago@example.com", password: "123456", points: 0310, university_id: uni5, tags: [tag10, tag6])
user6 = User.create(name: "Seba    ", email: "seba@example.com    ", password: "123456", points: 0510, university_id: uni1, tags: [tag7, tag5, tag3])
user7 = User.create(name: "Juanita ", email: "juanita@example.com ", password: "123456", points: 1200, university_id: uni1, tags: [tag7, tag5, tag3])

question1 = Question.create(title:  "¿como derivar 5x?"                             , numanswers: 0, content: "hola, como derivo esto?"                                      , user: user1, votes: 0, visits: 10, tags: [tag1,tag2]             , university_id: 1)
question2 = Question.create(title:  "¿integral de 34e^x?"                           , numanswers: 2, content: "hola, me cuesta integrar"                                     , user: user2, votes: 9, visits: 20, tags: [tag3]                  , university_id: 2)
question3 = Question.create(title:  "¿las ballenas azules?"                         , numanswers: 2, content: "hola, tengo una duda sobre las ballenas"                      , user: user1, votes: 0, visits: 30, tags: [tag4, tag5]            , university_id: 1)
question4 = Question.create(title:  "¿metabolismo de los perros?"                   , numanswers: 4, content: "hola, quiero saber mas sobre los perros"                      , user: user4, votes: 5, visits: 22, tags: [tag6]                  , university_id: 4)
question5 = Question.create(title:  "¿acordes de 7ma?"                              , numanswers: 0, content: "hola, que son estos acordes?"                                 , user: user3, votes: 0, visits: 33, tags: [tag1,tag5, tag7]       , university_id: 3)
question6 = Question.create(title:  "¿modo mixolidio?"                              , numanswers: 0, content: "buen dia, estaba leyendo sobre los modos griegos y..."        , user: user5, votes: 0, visits: 44, tags: [tag4, tag8]            , university_id: 5)
question7 = Question.create(title:  "¿que son las ondas electromagneticas?"         , numanswers: 0, content: "buen dia, estaba leyendo sobre la luz y no entiendo esto"     , user: user2, votes: 0, visits: 55, tags: [tag3]                  , university_id: 2)
question8 = Question.create(title:  "¿algoritmo mergesort?"                         , numanswers: 0, content: "hola, alguno tiene este algoritmo?"                           , user: user3, votes: 2, visits: 66, tags: [tag1,tag5, tag9]       , university_id: 3)
question9 = Question.create(title:  "¿la tierra es plana?"                          , numanswers: 0, content: "acabo de escuchar una teoria sobre esto, es real?"            , user: user5, votes: 0, visits: 11, tags: [tag2,tag4]             , university_id: 5)
question10 = Question.create(title: "¿que construyen las hormigas?"                 , numanswers: 0, content: "hola, hacen un castillo para su reina?"                       , user: user7, votes: 0, visits: 0, tags: [tag3,tag5]             , university_id: 1)
question11 = Question.create(title: "¿los iluminatis existen?"                      , numanswers: 1, content: "que pruebas hay, como me uno?"                                , user: user3, votes: 0, visits: 0, tags: [tag5, tag1, tag4, tag8], university_id: 3)
question12 = Question.create(title: "¿que madera es de mejor calidad, roble o pino?", numanswers: 1, content: "hola, queria comprar unos muebles y no se cuales son mejores?", user: user1, votes: 0, visits: 99, tags: [tag3]                  , university_id: 1)
question13 = Question.create(title: "¿por qué no lo soñó?"                          , numanswers: 0, content: "estaba escuchando la cancion y me pregunto?"                  , user: user1, votes: 0, visits: 0, tags: [tag3]                  , university_id: 1)

answer1 = Answer.create(question_id: 2,   votes: 0, user_id: 1, content: "yo usaria matlab y listo")
answer2 = Answer.create(question_id: 2,   votes: 0, user_id: 1, content: "mejor busca el wolfram alpha que no lo tenes que bajar")
answer3 = Answer.create(question_id: 3,   votes: 0, user_id: 2, content: "es un mito, algunas si otras no")
answer4 = Answer.create(question_id: 3,   votes: 0, user_id: 6, content: "depende la especie de ballena")
answer5 = Answer.create(question_id: 4,   votes: 0, user_id: 5, content: "no sabia que existia algo asi")
answer6 = Answer.create(question_id: 4,   votes: 0, user_id: 3, content: "en el libro Grecia Antigua te lo explica con detalle")
answer7 = Answer.create(question_id: 4,   votes: 0, user_id: 1, content: "se puede considerar interesante asldknasnfao")
answer8 = Answer.create(question_id: 4,   votes: 0, user_id: 2, content: "los perros blablabla 7 años")
answer9 = Answer.create(question_id: 12,  votes: 0, user_id: 4, content: "roble es mejor pero el pino es barato")
answer10 = Answer.create(question_id: 11, votes: 0, user_id: 3, content: "en los simpson estaban los magios")

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
