# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
  password: "password",
  address: "31 Curzon St, West Melbourne VIC 3003",
  phone_number: "0411222232",
  overall_rating: 5.0,
  food_safety_certified: true
)

chris = User.create!(
  name: "Chris",
  email: "chris@live.com",
  password: "password",
  address: "2 Burt St, Northcote VIC 3070",
  phone_number: "0411922199",
  overall_rating: 5.0,
  food_safety_certified: true
)

sam = User.create!(
  name: "Sam",
  email: "sam@live.com",
  password: "password",
  address: "49 Sackville St, Kew VIC 3101",
  phone_number: "0411622231",
  overall_rating: 5.0,
  food_safety_certified: true
)

theresa = User.create!(
  name: "Theresa",
  email: "theresa@live.com",
  password: "password",
  address: "1 State Route 42, Templestowe Lower VIC 3107",
  phone_number: "0411839021",
  overall_rating: 5.0,
  food_safety_certified: true
)

marc = User.create!(
  name: "Marc",
  email: "marc@live.com",
  password: "password",
  address: "155 Market St, South Melbourne VIC 3205",
  phone_number: "0456120437"
)

puts "Creating meals..."

lasagne = Meal.create!(
  user: User.first,
  name: "Lasagne",
  price: 7,
  description: "100% homemade and healthy ingredients",
  collect_from: DateTime.now.strftime('%Y-%m-%d %I %p'),
  collect_to: (DateTime.now + 2.day).strftime('%Y-%m-%d %I %p'),
  available_quantity: 8,
  cuisine: "Italian"
)

hamburger = Meal.create!(
  user: User.second,
  name: "Hamburger",
  price: 6,
  description: "Beef patty, wholemeal bread, cheese, lettuce, homemade aioli and tomatoes",
  collect_from: DateTime.now.strftime('%Y-%m-%d %I %p'),
  collect_to: (DateTime.now + 3.day).strftime('%Y-%m-%d %I %p'),
  available_quantity: 20,
  cuisine: "Western"
)

tiramisu = Meal.create!(
  user: User.third,
  name: "Tiramisu",
  price: 5,
  description: "Homemade tiramisu with a sweet, creamy, coffee flavour",
  collect_from: DateTime.now.strftime('%Y-%m-%d %I %p'),
  collect_to: (DateTime.now + 1.day).strftime('%Y-%m-%d %I %p'),
  available_quantity: 10,
  cuisine: "Italian"
)

laksa = Meal.create!(
  user: User.fourth,
  name: "Laksa",
  price: 9,
  description: "Gluten free and vegan! Guaranteed healthy and tasty!",
  collect_from: DateTime.now.strftime('%Y-%m-%d %I %p'),
  collect_to: (DateTime.now + 2.day).strftime('%Y-%m-%d %I %p'),
  available_quantity: 12,
  cuisine: "Asian"
)

puts "Creating orders..."
Order.create!(
  user: User.first
)

Order.create!(
  user: User.second
)

puts "Creating ordered meals..."

MealOrder.create!(
  meal: tiramisu,
  order: Order.first,
  quantity_ordered: 2,
  total_price: 10,
  pick_up: (DateTime.now + 1.day).strftime('%Y-%m-%d %I %p')
)

puts "Finished!"
