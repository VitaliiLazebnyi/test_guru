# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user     = User.create(name: 'Vitalii')
category = Category.create(title: 'General')
test     = category.tests.create(title: 'Rails', author: user)
question = test.questions.create(body: 'What is Rails?')
answer = question.answers.create(body: 'Fullstack framework.')
mark     = Mark.create(value: 5, user: user, test: test)
