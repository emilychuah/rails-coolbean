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
  food_safety_certified: true,
  profile: "Hi I'm Emily! I believe the biggest reward in cooking is being able to eat and enjoy it! I love following Gordon Ramsay's recipes when cooking as it is easy to follow and the flavours are always top-notch.",
)
emily.photos.attach(io: File.open('app/assets/images/emily.png'), filename: 'emily.png', content_type: 'image/png')

chris = User.create!(
  name: "Chris",
  email: "chris@live.com",
  password: "password",
  phone_number: "0411922199",
  overall_rating: 5.0,
  food_safety_certified: true,
  profile: "Hi I'm Chris and I have been a home cook since moving out of home. I love hosting parties and making food with lots of flavours. I am interested in combining flavours and food that go well with each other.",
)
chris.photos.attach(io: File.open('app/assets/images/chris.png'), filename: 'chris.png', content_type: 'image/png')

sam = User.create!(
  name: "Sam",
  email: "sam@live.com",
  password: "password",
  phone_number: "0411622231",
  overall_rating: 5.0,
  food_safety_certified: true,
  profile: "Hi, I'm Sam! I love reading into different recipes and attempting food of all cuisines. I often bake cakes for my family's and friends' birthdays, as well as for other occasions! I love bringing people together with food!",
)
sam.photos.attach(io: File.open('app/assets/images/sam.png'), filename: 'sam.png', content_type: 'image/png')

theresa = User.create!(
  name: "Theresa",
  email: "theresa@live.com",
  password: "password",
  phone_number: "0411839021",
  overall_rating: 5.0,
  food_safety_certified: true,
  profile: "Hi, I'm Theresa! I specialise in Asian cuisine. I love making healthy and fresh food to share! I also love having my food with lots of herbs as I believe it gives it a bit more flavour and an extra punch!",
)
theresa.photos.attach(io: File.open('app/assets/images/theresa.png'), filename: 'theresa.png', content_type: 'image/png')

puts "Creating meals..."

lasagne = Meal.create!(
  user: emily,
  name: "Lasagne",
  price: 9,
  description: "100% homemade and healthy ingredients",
  collect_from: DateTime.parse("2022-03-18 11:00:00 +1100").strftime("%Y-%m-%d %I %p"),
  collect_to: DateTime.parse("2022-03-18 14:00:00 +1100").strftime("%Y-%m-%d %I %p"),
  address: "31 Curzon St, West Melbourne VIC 3003",
  available_quantity: 10,
  cuisine: "Italian"
)
lasagne.photos.attach(io: URI.open('https://images.unsplash.com/photo-1619895092538-128341789043?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'), filename: 'lasagne.png', content_type: 'image/png')
lasagne.photos.attach(io: URI.open('https://media.istockphoto.com/photos/meat-lasagna-picture-id543831374?b=1&k=20&m=543831374&s=170667a&w=0&h=Dl6haMesq1rfa4YBKIt7WftN7hnexkNovxarCzPxf-M='), filename: 'lasagne.png', content_type: 'image/png')

hamburger = Meal.create!(
  user: chris,
  name: "Hamburger",
  price: 8,
  description: "Beef patty, wholemeal bread, cheese, lettuce, homemade aioli and tomatoes",
  collect_from: DateTime.parse("2022-03-18 17:00:00 +1100").strftime("%Y-%m-%d %I %p"),
  collect_to: DateTime.parse("2022-03-18 19:00:00 +1100").strftime("%Y-%m-%d %I %p"),
  address: "2 Burt St, Northcote VIC 3070",
  available_quantity: 15,
  cuisine: "Western"
)
hamburger.photos.attach(io: URI.open('https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=999&q=80'), filename: 'hamburger.png', content_type: 'image/png')
hamburger.photos.attach(io: URI.open('https://images.unsplash.com/photo-1561758033-d89a9ad46330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'), filename: 'hamburger.png', content_type: 'image/png')

laksa = Meal.create!(
  user: theresa,
  name: "Laksa",
  price_cents: 1250,
  description: "Gluten free and vegan! Guaranteed healthy and tasty!",
  collect_from: DateTime.parse("2022-03-18 12:00:00 +1100").strftime("%Y-%m-%d %I %p"),
  collect_to: DateTime.parse("2022-03-18 15:00:00 +1100").strftime("%Y-%m-%d %I %p"),
  address: "450 Elizabeth Street, Melbourne VIC 3000",
  available_quantity: 20,
  cuisine: "Southeast Asian"
)
laksa.photos.attach(io: URI.open('https://media.istockphoto.com/photos/singaporean-laksa-soup-picture-id907689936?b=1&k=20&m=907689936&s=170667a&w=0&h=cybLfOnIm_YZnLUeL7IoP9GV6D-Z0t1_he68vy-n9yM='), filename: 'laksa.png', content_type: 'image/png')
laksa.photos.attach(io: URI.open('https://media.istockphoto.com/photos/laksa-in-gray-bowl-on-concrete-table-top-coconut-noodle-soup-with-picture-id1306666187?k=20&m=1306666187&s=612x612&w=0&h=V77uILEsT8pIZn3DBsylA58wlZ4jb7Z-ZEa4S75KI-A='), filename: 'laksa.png', content_type: 'image/png')

nasi_lemak = Meal.create!(
  user: emily,
  name: "Nasi Lemak",
  price: 11,
  description: "Aromatic fluffy rice cooked with coconut milk, a Malaysian signature meal served with spicy sauce, fried chicken, eggs, cucumber, peanuts and fried anchovies.",
  collect_from: DateTime.parse("2022-03-18 09:00:00 +1100").strftime("%Y-%m-%d %I %p"),
  collect_to: DateTime.parse("2022-03-18 11:00:00 +1100").strftime("%Y-%m-%d %I %p"),
  address: "17 Armstrong Street, Greensborough VIC 3088",
  available_quantity: 18,
  cuisine: "Malaysian"
)
nasi_lemak.photos.attach(io: URI.open('https://media.istockphoto.com/photos/malay-food-nasi-lemak-picture-id453181731?k=20&m=453181731&s=612x612&w=0&h=oyIE7nCCtNj2YmatjtJgzjIE6GKFNr5MpFHFr3XkJJ4='), filename: 'nasilemak.png', content_type: 'image/png')
nasi_lemak.photos.attach(io: URI.open('https://media.istockphoto.com/photos/steamed-fat-rice-picture-id178570384?k=20&m=178570384&s=612x612&w=0&h=k09O_-_8keHnwWts2HAAd2gAC4GDXDssCG8GTpAJQFc='), filename: 'nasilemak.png', content_type: 'image/png')

ravioli = Meal.create!(
  user: chris,
  name: "Ravioli",
  price: 13,
  description: "Delicious Italian dumplings stuffed with ricotta, meat, cheese, and vegetables.",
  collect_from: DateTime.parse("2022-03-18 15:00:00 +1100").strftime("%Y-%m-%d %I %p"),
  collect_to: DateTime.parse("2022-03-18 17:00:00 +1100").strftime("%Y-%m-%d %I %p"),
  address: "431 Punt Road, Richmond VIC 3121",
  available_quantity: 6,
  cuisine: "Italian"
)
ravioli.photos.attach(io: URI.open('https://media.istockphoto.com/photos/spinach-and-ricotta-ravioli-with-tomato-sauce-and-parmesan-closeup-picture-id1309763468?k=20&m=1309763468&s=612x612&w=0&h=CzrP56cPEBlg0LjSaL0atEa-3CCv2EL0PmgYN4L19gU='), filename: 'ravioli.png', content_type: 'image/png')
ravioli.photos.attach(io: URI.open('https://media.istockphoto.com/photos/fresh-made-cheese-ravioli-picture-id1269950303?k=20&m=1269950303&s=612x612&w=0&h=IGwqOjUS7KxsgixKXM2PR7Tl3p1vo_XHquCLwDuqSY4='), filename: 'ravioli.png', content_type: 'image/png')

bun_bo_hue = Meal.create!(
  user: sam,
  name: "Bun Bo Hue",
  price: 10,
  description: "Mouth-watering Vietnamese spicy beef noodle soup.",
  collect_from: DateTime.parse("2022-03-18 13:00:00 +1100").strftime("%Y-%m-%d %I %p"),
  collect_to: DateTime.parse("2022-03-18 15:00:00 +1100").strftime("%Y-%m-%d %I %p"),
  address: "35 Swanston St, Heidelberg Heights VIC 3081",
  available_quantity: 12,
  cuisine: "Vietnamese"
)
bun_bo_hue.photos.attach(io: URI.open('https://media.istockphoto.com/photos/bun-rieu-a-kind-of-vietnamese-noodle-soup-picture-id499489940?k=20&m=499489940&s=612x612&w=0&h=JV-N-5VG0eJSMOzsGHtgdn3NRS9e4rBXu_YN92QsOi4='), filename: 'bunbohue.png', content_type: 'image/png')
bun_bo_hue.photos.attach(io: URI.open('https://media.istockphoto.com/photos/vegetarian-central-vietnamese-hot-and-spicy-soup-picture-id529114359?k=20&m=529114359&s=612x612&w=0&h=zhC4gDBVUWBqkBA7B8aGrkAluGisW01BwuJQHrmdoXc='), filename: 'bunbohue.png', content_type: 'image/png')

sushi = Meal.create!(
  user: theresa,
  name: "Sushi platter",
  price: 30,
  description: "An assortment of fresh and high-quality sushi made from scratch.",
  collect_from: DateTime.parse("2022-03-18 8:00:00 +1100").strftime("%Y-%m-%d %I %p"),
  collect_to: DateTime.parse("2022-03-18 10:00:00 +1100").strftime("%Y-%m-%d %I %p"),
  address: "21 Gaffney St, Coburg VIC 3058",
  available_quantity: 20,
  cuisine: "Japanese"
)
sushi.photos.attach(io: URI.open('https://media.istockphoto.com/photos/japanese-cuisine-set-with-classic-nigiri-sushi-fusion-hot-uramaki-picture-id1190771420?k=20&m=1190771420&s=612x612&w=0&h=uy9oxKLXGX-mtVKprkw-hwl7tb5bjkn_GxbmClxjV4c='), filename: 'sushi.png', content_type: 'image/png')
sushi.photos.attach(io: URI.open('https://media.istockphoto.com/photos/sushi-set-on-bamboo-plate-picture-id1053855452?k=20&m=1053855452&s=612x612&w=0&h=yEl9DZtumD162c5yb_nhjogyZvhpEND8HZAzj4LE7RM='), filename: 'sushi.png', content_type: 'image/png')

tiramisu = Meal.create!(
  user: sam,
  name: "Tiramisu",
  price: 10,
  description: "Homemade tiramisu with a sweet, creamy, coffee flavour",
  collect_from: DateTime.parse("2022-03-18 17:00:00 +1100").strftime("%Y-%m-%d %I %p"),
  collect_to: DateTime.parse("2022-03-18 20:00:00 +1100").strftime("%Y-%m-%d %I %p"),
  address: "49 Sackville St, Kew VIC 3101",
  available_quantity: 12,
  cuisine: "Italian"
)
tiramisu.photos.attach(io: URI.open('https://media.istockphoto.com/photos/tiramisu-picture-id585178794?k=20&m=585178794&s=612x612&w=0&h=4XO81PlNeCRRVCjtYgg6_5mYEB3tNfw5EGRk2Ezws08='), filename: 'tiramisu.png', content_type: 'image/png')
tiramisu.photos.attach(io: URI.open('https://media.istockphoto.com/photos/traditional-italian-tiramisu-dessert-cake-in-a-glass-form-decorated-picture-id1067016402?k=20&m=1067016402&s=612x612&w=0&h=qJXILf7oxY-icLgOuHhlbvjG9eEae74ZaF12tfNOsu8='), filename: 'tiramisu.png', content_type: 'image/png')

paella = Meal.create!(
  user: emily,
  name: "Paella",
  price: 15,
  description: "Spain's most popular rice dish cooked with meats, seafood and vegetables.",
  collect_from: DateTime.parse("2022-03-18 18:00:00 +1100").strftime("%Y-%m-%d %I %p"),
  collect_to: DateTime.parse("2022-03-18 21:00:00 +1100").strftime("%Y-%m-%d %I %p"),
  address: "78 Denison Dr, Yallambie VIC 3085",
  available_quantity: 25,
  cuisine: "Spanish"
)
paella.photos.attach(io: URI.open('https://media.istockphoto.com/photos/traditional-spanish-seafood-paella-picture-id1293104791?k=20&m=1293104791&s=612x612&w=0&h=9Z5lBjQ4y2ssUXIAThR9z9rrak8WxZeXUnVEU0T7YLs='), filename: 'paella.png', content_type: 'image/png')
paella.photos.attach(io: URI.open('https://media.istockphoto.com/photos/seafood-paella-picture-id155432436?k=20&m=155432436&s=612x612&w=0&h=PbIH1aRZAMcA362qj7Xs6ED4pwP8gyAO6DAkIfwNLbU='), filename: 'paella.png', content_type: 'image/png')

fish_and_chips = Meal.create!(
  user: chris,
  name: "Fish and Chips",
  price: 11,
  description: "Fried fish in crispy batter, served with thick-cut chips.",
  collect_from: DateTime.parse("2022-03-18 16:00:00 +1100").strftime("%Y-%m-%d %I %p"),
  collect_to: DateTime.parse("2022-03-18 18:00:00 +1100").strftime("%Y-%m-%d %I %p"),
  address: "83 Watson Ave, Mont Albert North VIC 3129",
  available_quantity: 7,
  cuisine: "British"
)
fish_and_chips.photos.attach(io: URI.open('https://media.istockphoto.com/photos/british-traditional-fish-and-chips-with-mashed-peas-tartar-sauce-and-picture-id1178035212?k=20&m=1178035212&s=612x612&w=0&h=Csf0nA31FtxFe6B5MST816pSSlBd2E2Kvjfo30g_wUU='), filename: 'fishnchips.png', content_type: 'image/png')
fish_and_chips.photos.attach(io: URI.open('https://media.istockphoto.com/photos/fish-and-chips-picture-id184929648?k=20&m=184929648&s=612x612&w=0&h=eHm3cV8plsmaoLcHGU0qJnMkzCxCWQH9jSxuI_e7adE='), filename: 'fishnchips.png', content_type: 'image/png')

bibimbap = Meal.create!(
  user: sam,
  name: "Bibimbap",
  price: 14,
  description: "A traditional Korean food which has rice, meat and assorted vegetables. Comes with side dishes as well.",
  collect_from: DateTime.parse("2022-03-18 12:00:00 +1100").strftime("%Y-%m-%d %I %p"),
  collect_to: DateTime.parse("2022-03-18 13:00:00 +1100").strftime("%Y-%m-%d %I %p"),
  address: "25 Taylor St, Ashburton VIC 3147",
  available_quantity: 13,
  cuisine: "Korean"
)
bibimbap.photos.attach(io: URI.open('https://media.istockphoto.com/photos/korean-bibimbap-dish-picture-id493066234?k=20&m=493066234&s=612x612&w=0&h=qyXP3oC0q0giTwvs7ySvB9x8nbqxew2EVwqt-f10ZUs='), filename: 'bibimbap.png', content_type: 'image/png')
bibimbap.photos.attach(io: URI.open('https://media.istockphoto.com/photos/korean-food-side-dishes-picture-id160117152?k=20&m=160117152&s=612x612&w=0&h=xEk7wsjRZKPvorIKil1-PXg27Bzdz1CvR9t84DxC_dw='), filename: 'bibimbap.png', content_type: 'image/png')

dumplings = Meal.create!(
  user: theresa,
  name: "Dumplings",
  price: 8,
  description: "A variety of juicy and delicate bite-sized dumplings.",
  collect_from: DateTime.parse("2022-03-18 12:00:00 +1100").strftime("%Y-%m-%d %I %p"),
  collect_to: DateTime.parse("2022-03-18 18:00:00 +1100").strftime("%Y-%m-%d %I %p"),
  address: "21 Junction St, Ringwood VIC 3134",
  available_quantity: 38,
  cuisine: "Chinese"
)
dumplings.photos.attach(io: URI.open('https://media.istockphoto.com/photos/dumplings-jiaozi-gyoza-steamed-on-white-plates-with-soy-sauce-and-picture-id1322454530?k=20&m=1322454530&s=612x612&w=0&h=eCnuLDECOPy31BMjaNDQ3efj7ynfb71AMw_w9xi8SwI='), filename: 'dumplings.png', content_type: 'image/png')
dumplings.photos.attach(io: URI.open('https://media.istockphoto.com/photos/hot-chinese-dumplings-gedza-in-the-steamer-picture-id1145478808?k=20&m=1145478808&s=612x612&w=0&h=Soh0h_J8Gz3o5BpCNKtOWZpnI6vAG-uAtBTCqTw2b_U='), filename: 'dumplings.png', content_type: 'image/png')
dumplings.photos.attach(io: URI.open('https://media.istockphoto.com/photos/chinese-dim-sum-picture-id1033208490?k=20&m=1033208490&s=612x612&w=0&h=W5ve7nTahm4hPFe9nyarwwmIEcDgeOb1HsTs6kvoo1I='), filename: 'dumplings.png', content_type: 'image/png')

puts "Creating reviews..."

Review.create!(
  comment: "This tiramisu is delicious, creamy and has an amazing mouthfeel.",
  rating: 5,
  meal: tiramisu
)

Review.create!(
  comment: "One big bite of this fills me with happiness. Thank you!",
  rating: 5,
  meal: tiramisu
)

Review.create!(
  comment: "Now, this tiramisu is very close to perfection. The creamiest, dreamiest, tastiest & most luscious I've ever had.",
  rating: 5,
  meal: tiramisu
)

puts "Finished!"
