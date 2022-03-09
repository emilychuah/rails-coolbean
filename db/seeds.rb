# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating users..."

marc = User.create!(
  name: "Marc",
  email: "marc@live.com",
  password: "password"
)

chris = User.create!(
  name: "Chris",
  email: "chris@live.com",
  password: "password"
)

emily = User.create!(
  name: "Emily",
  email: "emily@live.com",
  password: "password"
)

sam = User.create!(
  name: "Sam",
  email: "sam@live.com",
  password: "password"
)


theresa = User.create!(
  name: "Theresa",
  email: "theresa@live.com",
  password: "password"
)
