# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   meals = Meal.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', meal: meals.first)
puts 'cleaning database'

if Rails.env == "development"
  User.destroy_all
  Meal.destroy_all
  MealOrder.destroy_all
  Order.destroy_all
  Review.destroy_all
end

puts "Creating users..."

emily = User.create!(
  name: "Emily",
  email: "emily@live.com",
  password: "password"
)

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

puts "Creating meals..."

pasta = Meal.create!(
  user: User.first,
  name: "pasta",
  price: 10,
  description: "Delicious Pasta",
  collection_from: "2022-3-20 13:00:00",
  collection_to: "2022-3-22 13:00:00",
  available_quantity: 10,
  cuisine: "Italian"
)


fried_rice = Meal.create!(
  user: User.second,
  name: "fried rice",
  price: 8,
  description: "delicious rice",
  collection_from: "2022-3-30 15:00:00",
  collection_to: "2022-3-31 15:00:00",
  available_quantity: 15,
  cuisine: "Chinese"
)


tortilla = Meal.create!(
  user: User.third,
  name: "tortilla",
  price: 9,
  description: "delicious tortilla",
  collection_from: "2022-3-20 9:00:00",
  collection_to: "2022-3-22 10:00:00",
  available_quantity: 20,
  cuisine: "Mexican"
)


puts "Creating orders..."
Order.create!(
  user: sam
)

puts "Creating ordered meals..."

MealOrder.create!(
  meal: tortilla,
  order: Order.first,
  quantity_ordered: 2,
  total_price: 30,
  pick_up: DateTime.now.beginning_of_hour + 1.day
)
