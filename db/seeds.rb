# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Cm0k', firstname: "Vitalii", lastname: "Cm0k", email: "admin@email.com", password: '123456', type: 'Admin')
user     = User.create(name: 'Vitalii', email: "my#{Time.now.to_i}@email.com", password: '123456')
category = Category.create(title: "General#{Time.now.to_i}")
test     = category.tests.create(title: "Rails#{Time.now.to_i}", author: user)
question = test.questions.create(body: 'What is Rails?')
answer1   = question.answers.create(body: 'Fullstack framework.', correct: true)
answer2   = question.answers.create(body: 'Frontend framework.')
answer3   = question.answers.create(body: 'Backend framework.')
answer4   = question.answers.create(body: 'Some... framework.')
mark = TestPassage.create(
  correctly_answered: 3,
  user: user,
  test: test
)
