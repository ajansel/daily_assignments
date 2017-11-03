# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all
  user1 = User.create(email: 'Bob Ross')
  user2 = User.create(email: 'Martha Stewart')
  user3 = User.create(email: 'Antonio Brown')

  ShortenedUrl.destroy_all
  s1 = ShortenedUrl.create!(user3, "www.google.com")
  s2 = ShortenedUrl.create!(user1, "www.appacademy.io")
  s3 = ShortenedUrl.create!(user2, "www.github.com")

  Visit.destroy_all
  v1 = Visit.record_visit!(user3, s1)
  v2 = Visit.record_visit!(user1, s2)
  v3 = Visit.record_visit!(user2, s3)
end
