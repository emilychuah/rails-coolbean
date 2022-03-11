# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   meals = Meal.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', meal: meals.first)

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
  phone_number: "0411222232",
  overall_rating: 5.0,
  food_safety_certified: true
)

chris = User.create!(
  name: "Chris",
  email: "chris@live.com",
  password: "password",
  phone_number: "0411922199",
  overall_rating: 5.0,
  food_safety_certified: true
)

sam = User.create!(
  name: "Sam",
  email: "sam@live.com",
  password: "password",
  phone_number: "0411622231",
  overall_rating: 5.0,
  food_safety_certified: true
)

theresa = User.create!(
  name: "Theresa",
  email: "theresa@live.com",
  password: "password",
  phone_number: "0411839021",
  overall_rating: 5.0,
  food_safety_certified: true
)

marc = User.create!(
  name: "Marc",
  email: "marc@live.com",
  password: "password",
  phone_number: "0456120437"
)

puts "Creating meals..."

lasagne = Meal.create!(
  user: emily,
  name: "Lasagne",
  price: 7,
  description: "100% homemade and healthy ingredients",
  collect_from: (DateTime.now - 2.hour).strftime("%Y-%m-%d %I %p"),
  collect_to: (DateTime.now + 2.day - 2.hour).strftime("%Y-%m-%d %I %p"),
  address: "31 Curzon St, West Melbourne VIC 3003",
  available_quantity: 8,
  cuisine: "Italian",
  picture_url: "https://images.unsplash.com/photo-1619895092538-128341789043?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"
)

hamburger = Meal.create!(
  user: chris,
  name: "Hamburger",
  price: 6,
  description: "Beef patty, wholemeal bread, cheese, lettuce, homemade aioli and tomatoes",
  collect_from: (DateTime.now - 1.hour).strftime("%Y-%m-%d %I %p"),
  collect_to: (DateTime.now + 3.day - 1.hour).strftime("%Y-%m-%d %I %p"),
  address: "2 Burt St, Northcote VIC 3070",
  available_quantity: 20,
  cuisine: "Western",
  picture_url: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=999&q=80"
)

tiramisu = Meal.create!(
  user: sam,
  name: "Tiramisu",
  price: 5,
  description: "Homemade tiramisu with a sweet, creamy, coffee flavour",
  collect_from: DateTime.now.strftime("%Y-%m-%d %I %p"),
  collect_to: (DateTime.now + 1.day).strftime("%Y-%m-%d %I %p"),
  address: "49 Sackville St, Kew VIC 3101",
  available_quantity: 10,
  cuisine: "Italian",
  picture_url: "https://media.istockphoto.com/photos/portion-of-tiramisu-dessert-picture-id1061450296?b=1&k=20&m=1061450296&s=170667a&w=0&h=9OmAEu8aPV3Q1U_HwlFq1nHjrt1TQcII-wxS4HSCl_c="
)

laksa = Meal.create!(
  user: theresa,
  name: "Laksa",
  price: 9,
  description: "Gluten free and vegan! Guaranteed healthy and tasty!",
  collect_from: (DateTime.now - 3.hour).strftime("%Y-%m-%d %I %p"),
  collect_to: (DateTime.now + 2.day - 3.hour).strftime("%Y-%m-%d %I %p"),
  address: "450 Elizabeth Street, Melbourne VIC 3000",
  available_quantity: 12,
  cuisine: "Asian",
  picture_url: "https://media.istockphoto.com/photos/singaporean-laksa-soup-picture-id907689936?b=1&k=20&m=907689936&s=170667a&w=0&h=cybLfOnIm_YZnLUeL7IoP9GV6D-Z0t1_he68vy-n9yM="
)

puts "Creating orders..."

Order.create!(
  user: User.first
)

puts "Creating ordered meals..."

MealOrder.create!(
  meal: tiramisu,
  order: Order.first,
  quantity_ordered: 2,
  total_price: 10,
  pick_up: (DateTime.now + 1.day).strftime("%Y-%m-%d %I %p")
)

puts "Finished!"
