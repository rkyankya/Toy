# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  name = "foobar#{n + 1}"
  first = Faker::Name.first_name
  last = Faker::Name.last_name
  email = "foo#{n + 1}@bar.com"
  password = 'foobar'
  gravatar = Faker::Avatar.image(slug: 'my-own-slug', size: '50x50', format: 'jpg')
  User.create!(username: name,
               first_name: first,
               last_name: last,
               email: email,
               password: password,
               gravatar: gravatar)
end
