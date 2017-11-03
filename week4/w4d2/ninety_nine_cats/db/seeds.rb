# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
cat1 = Cat.create(name: Faker::GameOfThrones.character, sex: 'M', color: 'black', birth_date: Faker::Date.birthday(1,10), description: 'I am cat #1')
cat2 = Cat.create(name: Faker::GameOfThrones.character, sex: 'F', color: 'brown', birth_date: Faker::Date.birthday(1,10), description: 'I am cat #2')
cat3 = Cat.create(name: Faker::GameOfThrones.character, sex: 'M', color: 'white', birth_date: Faker::Date.birthday(1,10), description: 'I am cat #3')
cat4 = Cat.create(name: Faker::GameOfThrones.character, sex: 'F', color: 'calico', birth_date: Faker::Date.birthday(1,10), description: 'I am cat #4')
cat5 = Cat.create(name: Faker::GameOfThrones.character, sex: 'M', color: 'gray', birth_date: Faker::Date.birthday(1,10), description: 'I am cat #5')

CatRentalRequest.destroy_all
crr1 = CatRentalRequest.create(cat_id: cat5.id, start_date: '2000-01-01', end_date: '2001-01-01')
crr2 = CatRentalRequest.create(cat_id: cat4.id, start_date: '2002-01-01', end_date: '2003-01-01')
crr3 = CatRentalRequest.create(cat_id: cat3.id, start_date: '2004-01-01', end_date: '2005-01-01')
crr4 = CatRentalRequest.create(cat_id: cat2.id, start_date: '2006-01-01', end_date: '2007-01-01')
crr5 = CatRentalRequest.create(cat_id: cat1.id, start_date: '2008-01-01', end_date: '2009-01-01')
