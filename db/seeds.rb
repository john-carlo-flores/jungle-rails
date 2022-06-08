# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Evergreens'
cat2 = Category.find_or_create_by! name: 'Shrubs'
cat3 = Category.find_or_create_by! name: 'Trees'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

prod1 = cat1.products.create!({
  name:  'Giant Tea',
  description: "The Giant Tea is an uncommon, medium-sized plant and can be found only in some tundras. It blooms twice a year, for 3 weeks.
  It has narrow, paired leaves, which are usually yellow-green. It also grows large flowers, which can be blue, bronze, light yellow, purple and light grey.
  
  These plants grow in decent numbers, but it's near impossible to control and maintain their growth.
  They can be used as an anesthetic.
  
  As a defense mechanism the Giant Tea grow slippery leaves to prevent insects from easily eaten them.
  They rely on animal pollination to reproduce. To promote pollination, they produce aromatic scents.",
  image: open_asset('plante_1.jpg'),
  quantity: 0,
  price: 64.99
})

prod2 = cat1.products.create!({
  name:  'Scented Blade',
  description: "
  The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas. It blooms once a year, for 2 weeks.
  It has thin, palmate leaves, which are usually lime green. It also grows small flowers, which can be dark blue, light gold and dark red.

  These plants grow in large groups, but it's fairly easy to control and maintain their growth.
  They can be eaten to relief a sore throat.

  As a defense mechanism the Scented Blade can collapse its flowers when it detects vibrations.
  They rely on animal pollination to reproduce. Once pollinated, they grow fairly large, delicious nuts.",
  image: open_asset('plante_2.jpg'),
  quantity: 18,
  price: 24.99
})

prod3 = cat1.products.create!({
  name:  'Lion Grapevine',
  description: "The Lion Grapevine is an uncommon, modest plant and can be found only in some humid regions. It blooms once a year, for 4 months.
  It has wide, squared leaves, which are usually purple. It also grows tiny flowers, which can be dark bronze and orange.
  
  These plants grow in large groups, but it's really tricky to control and maintain their growth.
  They can be brewed as tea.
  
  As a defense mechanism the Lion Grapevine grows small thorns.
  They rely on wind pollination to reproduce. Once pollinated, they grow small, inedible fruits.",
  image: open_asset('plante_3.jpg'),
  quantity: 4,
  price: 34.49
})

cat1.products.create!({
  name:  'Bone Coneflower',
  description: "The Bone Coneflower is an uncommon, small plant and can be found only in some forests. It blooms in early spring.
  It has thick, paired leaves, which are usually blue-green. It also grows large flowers, which can be dark blue, dark orange and light brown.
  
  These plants grow within short distances from each other, but it's a bit tricky to control and maintain their growth.
  They can be used to treat wounds.
  
  As a defense mechanism the Bone Coneflower is poisonous for most creatures.
  They rely on self pollination to reproduce. Once pollinated, they grow fairly large, inedible fruits.",
  image: open_asset('plante_4.jpg'),
  quantity: 8,
  price: 24.99
})

cat1.products.create!({
  name:  'Enirthelda',
  description: "The Enirthelda is an uncommon, large plant and can be found only in some forests. It blooms once a year, for 2 months.
  It has narrow, barb shaped leaves, which are usually blue-green. It also grows huge flowers, which can be purple and light red.
  
  These plants grow in small numbers, but it's extremely easy to control and maintain their growth.
  They can be cooked and eaten.
  
  As a defense mechanism the Enirthelda produces a thick, sticky wax.
  They rely on wind pollination to reproduce. Once pollinated, they grow fairly large, inedible nuts.",
  image: open_asset('plante_5.jpg'),
  quantity: 8,
  price: 124.99
})

cat1.products.create!({
  name:  'Swamp Root',
  description: "The Swamp Root is a very common, huge plant and can be found in most subarctic regions. It blooms once a year, for 1 week.
  It has wide, egg shaped leaves, which are usually blue-green. It also grows tiny flowers, which can be dark pink, light purple and dark red.
  
  These plants grow in large groups, but it's extremely easy to control and maintain their growth.
  They can be used to create a poison.
  
  As a defense mechanism the Swamp Root taste extremely sour.
  They rely on animal pollination to reproduce. To promote pollination, they produce a delicious nectar.",
  image: open_asset('plante_6.jpg'),
  quantity: 82,
  price: 24.49
})


cat2.products.create!({
  name:  'Sweet Hops',
  description: "The Sweet Hop is a rare, medium-sized plant and can be found only at lake borders. It blooms twice a year, for 2 months.
  It has thin, diamond shaped leaves, which are usually light red. It also grows tiny flowers, which can be dark pink, brown and pink.
  
  These plants grow in large groups, but it's hard, especially without experience, to control and maintain their growth.
  They have no real use, besides their aesthetics.
  
  As a defense mechanism the Sweet Hop relies mostly on its surroundings to survive.
  They rely on self pollination to reproduce. Once pollinated, they grow fairly large, delicious nuts.",
  image: open_asset('plante_7.jpg'),
  quantity: 40,
  price: 64.49
})

cat2.products.create!({
  name:  'Tangle Azolla',
  description: "The Tangle Azolla is a very rare, modest plant and can be found in any cold region. It blooms once a year, for 2 months.
  It has wide, palmate leaves, which are usually light orange. It also grows tiny flowers, which can be light grey, white, light blue, light purple and light gold.
  
  These plants grow in large groups, but it's near impossible to control and maintain their growth.
  They have no use, but look nice in gardens.
  
  As a defense mechanism the Tangle Azolla grow slippery leaves to prevent insects from easily eaten them.
  They rely on self pollination to reproduce. Once pollinated, they grow delicious, small fruits.",
  image: open_asset('plante_8.jpg'),
  quantity: 3,
  price: 24.99
})

cat2.products.create!({
  name:  'Krapliper',
  description: "The Krapliper is a rare, modest plant and can be found only in deserts. It blooms once a year, for 2 weeks.
  It has thick, sickle shaped leaves, which are usually lime green. It also grows tiny flowers, which can be light bronze, orange and gold.
  
  These plants grow within short distances from each other, but it's really difficult to control and maintain their growth.
  They can be used to treat wounds.
  
  As a defense mechanism the Krapliper produces a thick, sticky wax.
  They rely on self pollination to reproduce. Once pollinated, they grow fairly large, inedible fruits.",
  image: open_asset('plante_9.jpg'),
  quantity: 32,
  price: 1999.99
})

cat3.products.create!({
  name:  'Eesrorn',
  description: "The Eesrorn is a very common, tall plant and can be found in most subarctic regions. It blooms twice a year, for 2 months.
  It has large, needle leaves, which are usually light yellow. It also grows decent sized flowers, which can be light grey, yellow and light blue.
  
  These plants grow separated by a fair distance from each other, but it's hard to control and maintain their growth.
  They have no real use.
  
  As a defense mechanism the Eesrorn has a thick, wooden stem.
  They rely on water currents to carry their seeds away to reproduce. Once pollinated, they grow fairly large, inedible fruits.",
  image: open_asset('plante_10.jpg'),
  quantity: 320,
  price: 39.99
})

cat3.products.create!({
  name:  'Void Fennel',
  description: "The Void Fennel is an uncommon, tall plant and can be found only in some snowy regions. It blooms in late autumn.
  It has narrow, elliptic leaves, which are usually mint green. It also grows large flowers, which can be dark orange, bronze, dark grey and dark pink.
  
  These plants grow alone, but within a decent distance from each other, but it's very easy to control and maintain their growth.
  They have no real use, besides their aesthetics.
  
  As a defense mechanism the Void Fennel has a thick, wooden stem.
  They rely on water currents to carry their seeds away to reproduce. Once pollinated, they grow fairly large, inedible fruits.",
  image: open_asset('plante_11.jpg'),
  quantity: 2,
  price: 87.65
})

prod4 = cat3.products.create!({
  name:  'Cliff Collard',
  description: "The Cliff Collard is a very rare, tiny plant and can be found in damp places. It blooms twice a year, for 1 week.
  It has wide, spear shaped leaves, which are usually lime green. It also grows quite large flowers, which can be silver, light brown and light red.
  
  These plants grow within short distances from each other, but it's fairly hard to control and maintain their growth.
  They can be brewed as tea.
  
  As a defense mechanism the Cliff Collard grows thick thorns.
  They rely on winds to carry their seeds away to reproduce. Once pollinated, they grow small, inedible fruits.",
  image: open_asset('plante_12.jpg'),
  quantity: 23,
  price: 79.99
})

## USERS

puts "Re-creating Users ..."

User.destroy_all

user1 = User.create!({
  first_name: "Cordi",
  last_name: "Gonet",
  email: "cgonet0@seattletimes.com",
  password: "password",
  password_confirmation: "password",
})

user2 = User.create!({
  first_name: "Sibylle",
  last_name: "Keningham",
  email: "skeningham1@slashdot.org",
  password: "password",
  password_confirmation: "password",
})

user3 = User.create!({
  first_name: "Mellie",
  last_name: "Roycraft",
  email: "mroycraft2@gov.uk",
  password: "password",
  password_confirmation: "password",
})

user4 = User.create!({
  first_name: "Jewell",
  last_name: "Kelsey",
  email: "jkelsey3@nyu.edu",
  password: "password",
  password_confirmation: "password",
})

user5 = User.create!({
  first_name: "Octavia",
  last_name: "Boyse",
  email: "oboyse4@sphinn.com",
  password: "password",
  password_confirmation: "password",
})

user6 = User.create!({
  first_name: "Gohan",
  last_name: "Shiba",
  email: "email@email.com",
  password: "password",
  password_confirmation: "password",
})

## REVIEWS

puts "Re-creating Reviews ..."

Review.destroy_all

Review.create!({
  product: prod1,
  user: user2,
  rating: 3,
  description: "This plant is bussin'!"
})

Review.create!({
  product: prod1,
  user: user2,
  rating: 3,
  description: "This plant is aight.."
})

Review.create!({
  product: prod1,
  user: user3,
  rating: 4,
  description: "This plant is awesome. It takes the cake for sure!"
})

Review.create!({
  product: prod2,
  user: user4,
  rating: 1,
  description: "I am allergic to this plant!"
})

Review.create!({
  product: prod2,
  user: user5,
  rating: 2,
  description: "This plant blocks all the sunlight :("
})

Review.create!({
  product: prod3,
  user: user6,
  rating: 5,
  description: "Woof!"
})

Review.create!({
  product: prod4,
  user: user1,
  rating: 5,
  description: "Oh man...word cannot express what happened to me after eating these. If you are someone that can tolerate the sugar substitute, enjoy. If you are like the dozens of people that tried my order, Run!\n\nFirst of all, for taste I would rate these as a 5. So good. Soft, true-to-taste fruit flavors like the sugar variety...I was a happy camper\n\nBUT (or should I say BUTT), not long after eating about 20 of these all hell broke loose. I had a gastrointenstinal experience like nothing I've ever imagined. Cramps, sweating, bloating beyond my worst nightmare. I've had food poisoning from bad shellfish and that was almost like a skip in the park compared to what was going on iside me.\n\nThen came the, uh, flatulence. HEavents to Murgatroyd, the sounds, like trumpets calling the demons back to Hell...the strethc, like 1,000 rotten corpses vomited. I couldn't stand to stay in one room for fear of succumbing to my own odors.\n\nIf you order these, best of luck to you. And please, don't post a video review during the aftershocks."
})

puts "DONE!"


# Photo by <a href="https://unsplash.com/@scottwebb?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Scott Webb</a> on <a href="https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
# Photo by <a href="https://unsplash.com/@sarahdorweiler?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Sarah Dorweiler</a> on <a href="https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
# Photo by <a href="https://unsplash.com/@tegethoff?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Mark Tegethoff</a> on <a href="https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
# Photo by <a href="https://unsplash.com/@danielcgold?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Dan Gold</a> on <a href="https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
# Photo by <a href="https://unsplash.com/@feeypflanzen?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Severin Candrian</a> on <a href="https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
# Photo by <a href="https://unsplash.com/@karishea?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Kari Shea</a> on <a href="https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
# Photo by <a href="https://unsplash.com/@nate_dumlao?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Nathan Dumlao</a> on <a href="https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
# Photo by <a href="https://unsplash.com/@galina88?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Galina N</a> on <a href="https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
# Photo by <a href="https://unsplash.com/@brina_blum?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Brina Blum</a> on <a href="https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
# Photo by <a href="https://unsplash.com/@jonathanborba?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Jonathan Borba</a> on <a href="https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
# Photo by <a href="https://unsplash.com/@karaeads?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Kara Eads</a> on <a href="https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
# Photo by <a href="https://unsplash.com/@mrlessy?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Kevin Lessy</a> on <a href="https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
# Photo by <a href="https://unsplash.com/@szmigieldesign?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Lukasz Szmigiel</a> on <a href="https://unsplash.com/s/photos/forest?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
  