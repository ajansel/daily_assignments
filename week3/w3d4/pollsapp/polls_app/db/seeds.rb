# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all
  user1 = User.create(username: 'CJ')
  user2 = User.create(username: 'Flarnie')
  user3 = User.create(username: 'Jeff')
  user4 = User.create(username: 'Georges St. Pierre')
  user5 = User.create(username: 'Ned')


  Poll.destroy_all
  poll1 = Poll.create(title: 'Favorites', author_id: user5.id)



  Question.destroy_all
  question1 = Question.create(question_text: 'Color', poll_id: poll1.id)
  question2 = Question.create(question_text: 'fav animal', poll_id: poll1.id)
  question3 = Question.create(question_text: 'fav food???', poll_id: poll1.id)
  question4 = Question.create(question_text: 'fav jello?!', poll_id: poll1.id)

  AnswerChoice.destroy_all
  answer1 = AnswerChoice.create(question_id: question1.id, answer: 'blue')
  answer2 = AnswerChoice.create(question_id: question1.id, answer: 'yellow')
  answer3 = AnswerChoice.create(question_id: question2.id, answer: 'cat')
  answer4 = AnswerChoice.create(question_id: question2.id, answer: 'different cat')
  answer5 = AnswerChoice.create(question_id: question3.id, answer: 'wings')
  answer6 = AnswerChoice.create(question_id: question3.id, answer: 'frois gras')
  answer7 = AnswerChoice.create(question_id: question4.id, answer: 'blue')
  answer8 = AnswerChoice.create(question_id: question4.id, answer: 'square')

  Response.destroy_all
  Response.create(user_id: user1.id, answer_choice_id: answer1.id)
  Response.create(user_id: user1.id, answer_choice_id: answer3.id)
  Response.create(user_id: user1.id, answer_choice_id: answer5.id)
  Response.create(user_id: user1.id, answer_choice_id: answer7.id)
  Response.create(user_id: user2.id, answer_choice_id: answer2.id)
  Response.create(user_id: user2.id, answer_choice_id: answer4.id)
  Response.create(user_id: user2.id, answer_choice_id: answer6.id)
  Response.create(user_id: user2.id, answer_choice_id: answer8.id)


end
