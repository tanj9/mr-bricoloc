# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'START SEEDING'
puts '0. cleaning database'
User.destroy_all
Tool.destroy_all
Booking.destroy_all

puts '1. SEED USERS'
user = User.new(
  first_name: 'Adrien',
  last_name: 'Pointillart',
  address: '1 place du Chatelet',
  city: 'Paris',
  date_of_birth: '07/03/1967',
  email: 'apointillart@gmail.com',
  password: '000000'
)
file = URI.open('https://kitt.lewagon.com/placeholder/users/apointil')
user.photo.attach(io: file, filename: 'adrien.jpg', content_type: 'image/jpg')
user.save!
puts "created user: #{user.first_name}"

user = User.new(
  first_name: 'Marion',
  last_name: 'Rigard',
  address: '3 rue Elzevir',
  city: 'Paris',
  date_of_birth: '22/11/2000',
  email: 'marion.rigard@gmail.com',
  password: '000000'
)
file = URI.open('https://kitt.lewagon.com/placeholder/users/rigardM')
user.photo.attach(io: file, filename: 'marion.jpg', content_type: 'image/jpg')
user.save!
puts "created user: #{user.first_name}"

user = User.new(
  first_name: 'Florent',
  last_name: 'Géron',
  address: '55 rue Victor Hugo',
  city: 'Montreuil',
  date_of_birth: '16/07/1994',
  email: 'florent.geron@orange.fr',
  password: '000000'
)
file = URI.open('https://kitt.lewagon.com/placeholder/users/FlorentGeron')
user.photo.attach(io: file, filename: 'florent.jpg', content_type: 'image/jpg')
user.save!
puts "created user: #{user.first_name}"

user = User.new(
  first_name: 'Jérôme',
  last_name: 'Tan',
  address: '14 rue Friant',
  city: 'Paris',
  date_of_birth: '16/07/1980',
  email: 'jerome.tan@tuta.io',
  password: '000000'
)
file = URI.open('https://kitt.lewagon.com/placeholder/users/tanj9')
user.photo.attach(io: file, filename: 'jerome.jpg', content_type: 'image/jpg')
user.save!
puts "created user: #{user.first_name}"

puts "created #{User.count} users"

puts '2. SEED TOOLS'
user = User.find_by(first_name: 'Florent')
tool = Tool.new(
  name: 'Wrench',
  category: 'works',
  sub_category: 'handtools',
  daily_price: 5,
  description: 'Beautiful wrench. Brand new. You can have it all weekdays. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec rutrum congue leo eget malesuada. Proin eget tortor risus. Cras ultricies ligula sed magna dictum porta.',
  condition: 5,
  available: true
)
file = URI.open('https://www.sweidas.com.au/assets/full/WE8119.png?20200707031458')
tool.photo.attach(io: file, filename: 'wrench.jpg', content_type: 'image/jpg')
tool.user = user
tool.address = "#{user.address}, #{user.city}"
tool.save!
puts "created tool: #{tool.name}"

tool = Tool.new(
  name: 'Ripper',
  category: 'works',
  sub_category: 'powertools',
  daily_price: 15,
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec rutrum congue leo eget malesuada. Quisque velit nisi, pretium ut lacinia in, elementum id enim.',
  condition: 3,
  available: true
)
file = URI.open('https://static.lceassets.com/thumbnails/c7/c786d11f6781dcafa5ba8f31450864837abda470/defonceuse-electronique-8mm-1100w-rp1110cj-makita-square-650x650.jpg')
tool.photo.attach(io: file, filename: 'ripper.jpg', content_type: 'image/jpg')
tool.user = user
tool.address = "#{user.address}, #{user.city}"
tool.save!
puts "created tool: #{tool.name}"

user = User.find_by(first_name: 'Adrien')
tool = Tool.new(
  name: 'Shovel',
  category: 'garden',
  sub_category: 'handtools',
  daily_price: 5,
  description: 'Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.',
  condition: 4,
  available: true
)
file = URI.open('https://cdn.shopify.com/s/files/1/0294/0862/4685/products/Gold-Painted-Groundbreaking-Shovel-Black-Handle_800x.png')
tool.photo.attach(io: file, filename: 'shovel.jpg', content_type: 'image/jpg')
tool.user = user
tool.address = "#{user.address}, #{user.city}"
tool.save!
puts "created tool: #{tool.name}"

tool = Tool.new(
  name: 'Hammer Drill',
  category: 'works',
  sub_category: 'powertools',
  daily_price: 9,
  description: 'Powerful cordless hammer drill for heavy-duty use in interior construction. + kit accessories',
  condition: 5,
  available: true
)
file = URI.open('https://m.media-amazon.com/images/I/61qKNsJKxZL._AC_SL1000_.jpg')
tool.photo.attach(io: file, filename: 'drill_teeno.jpg', content_type: 'image/jpg')
tool.user = user
tool.address = "#{user.address}, #{user.city}"
tool.save!
puts "created tool: #{tool.name}"

tool = Tool.new(
  name: 'Drill/Driver',
  category: 'works',
  sub_category: 'powertools',
  daily_price: 6,
  description: 'Cordless drill/driver up to 10 mm/M 5',
  condition: 3,
  available: true
)
file = URI.open('https://s3-us-west-2.amazonaws.com/lend-engine/libraryofstuff/large/5f7062dca37f6.jpg')
tool.photo.attach(io: file, filename: 'drill_driver.jpg', content_type: 'image/jpg')
tool.user = user
tool.address = "#{user.address}, #{user.city}"
tool.save!
puts "created tool: #{tool.name}"

user = User.find_by(first_name: 'Florent')
tool = Tool.new(
  name: 'Two green screwdrivers',
  category: 'works',
  sub_category: 'handtools',
  daily_price: 1,
  description: 'Allow you to screw and unscrew. Donec sollicitudin molestie malesuada. Sed porttitor lectus nibh. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus.
  ',
  condition: 1,
  available: false
)
file = URI.open('https://images.tom.shop/producten/original/haba_terra_kids_schroevendraaierset_17_cm_groen_zilver_twee_stuks_239992.jpg')
tool.photo.attach(io: file, filename: 'green_screwdrivers.jpg', content_type: 'image/jpg')
tool.user = user
tool.address = "#{user.address}, #{user.city}"
tool.save!
puts "created tool: #{tool.name}"

user = User.find_by(first_name: 'Florent')
tool = Tool.new(
  name: 'Hedge trimmer',
  category: 'garden',
  sub_category: 'motorized',
  daily_price: 15,
  description: 'Efficient and easy to use. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Donec sollicitudin molestie malesuada. Curabitur aliquet quam id dui posuere blandit.',
  condition: 3,
  available: true
)
file = URI.open('http://hortimeca.be/102-thickbox_default/taille-haie-echo-xechcr1501.jpg')
tool.photo.attach(io: file, filename: 'hedge_trimmer.jpg', content_type: 'image/jpg')
tool.user = user
tool.address = "#{user.address}, #{user.city}"
tool.save!
puts "created tool: #{tool.name}"

tool = Tool.new(
  name: 'Hammer Drill',
  category: 'works',
  sub_category: 'powertools',
  daily_price: 8,
  description: 'Cordless hammer drill, diameter of 30 - 40 mm, no vibrations',
  condition: 4,
  available: true
)
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA6aseZui4UimuUNnVtLAzfsSvrJ74S3X5hjE0-rsDXVuAI09-xH19gblSqwQddVfdjeI&usqp=CAU')
tool.photo.attach(io: file, filename: 'drill_matika.jpg', content_type: 'image/jpg')
tool.user = user
tool.address = "#{user.address}, #{user.city}"
tool.save!
puts "created tool: #{tool.name}"

user = User.find_by(first_name: 'Jérôme')
tool = Tool.new(
  name: 'Watering can',
  category: 'gardening',
  sub_category: 'handtools',
  daily_price: 3,
  description: 'To keep seedlings and young plants refreshed a watering can with a “rose” (the sprinkler attachment on the end of the watering spout) will distribute water more lightly and evenly.',
  condition: 5,
  available: true
)
file = URI.open('https://static.wixstatic.com/media/557d9b_2d360222e3244995ae6df249d5408a1e~mv2.jpg/v1/fill/w_1000,h_667,al_c,q_90,usm_0.66_1.00_0.01/557d9b_2d360222e3244995ae6df249d5408a1e~mv2.jpg')
tool.photo.attach(io: file, filename: 'watering_cab.jpg', content_type: 'image/jpg')
tool.user = user
tool.address = "#{user.address}, #{user.city}"
tool.save!
puts "created tool: #{tool.name}"

user = User.find_by(first_name: 'Adrien')
tool = Tool.new(
  name: 'Circular Saw',
  category: 'works',
  sub_category: 'powertools',
  daily_price: 12,
  description: 'The Makita circular saw is compact and lightweight, and is double insulated to help minimise noise, keeping it to 87dB and under. Out of all our top picks, this saw has one of the best cutting depths at 66mm, and is equipped with an aluminium base plate and die cast safety cover for increased durability.',
  condition: 4,
  available: true
)
file = URI.open('https://i0.wp.com/homefixated.com/wp-content/uploads/2012/06/circular-saw.jpg')
tool.photo.attach(io: file, filename: 'circular_saw.jpg', content_type: 'image/jpg')
tool.user = user
tool.address = "#{user.address}, #{user.city}"
tool.save!
puts "created tool: #{tool.name}"

user = User.find_by(first_name: 'Jérôme')
tool = Tool.new(
  name: 'Mower',
  category: 'gardening',
  sub_category: 'motorized',
  daily_price: 15,
  description: 'To keep seedlings and young plants refreshed a watering can with a “rose” (the sprinkler attachment on the end of the watering spout) will distribute water more lightly and evenly.',
  condition: 3,
  available: true
)
file = URI.open('https://s3-us-west-2.amazonaws.com/lend-engine/libraryofstuff/large/5e7625a451b7d.jpg')
tool.photo.attach(io: file, filename: 'mower.jpg', content_type: 'image/jpg')
tool.user = user
tool.address = "#{user.address}, #{user.city}"
tool.save!
puts "created tool: #{tool.name}"

user = User.find_by(first_name: 'Jérôme')
tool = Tool.new(
  name: 'Stepladder',
  category: 'wordks',
  sub_category: 'handtools',
  daily_price: 4,
  description: 'Superfold Step ladder. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.',
  condition: 4,
  available: true
)
file = URI.open('https://webimg.secondhandapp.at/w-i-mgl/5a214eb6057a87541de950d9')
tool.photo.attach(io: file, filename: 'stepladder.jpg', content_type: 'image/jpg')
tool.user = user
tool.address = "#{user.address}, #{user.city}"
tool.save!
puts "created tool: #{tool.name}"

user = User.find_by(first_name: 'Jérôme')
tool = Tool.new(
  name: 'Helmet',
  category: 'works',
  sub_category: 'protection',
  daily_price: 3,
  description: 'Safety first ! You can borrow my helmet.Donec rutrum congue leo eget malesuada. Nulla porttitor accumsan tincidunt.',
  condition: 5,
  available: true
)
file = URI.open('https://ae01.alicdn.com/kf/HTB11.zlXaWs3KVjSZFxq6yWUXXaX/ABS-Construction-Safety-Helmets-Electrical-Engineering-Hard-Hat-Labor-Protective-Helmet-High-Quality-Men-Women-Work.jpg_Q90.jpg_.webp')
tool.photo.attach(io: file, filename: 'helmet.jpg', content_type: 'image/jpg')
tool.user = user
tool.address = "#{user.address}, #{user.city}"
tool.save!
puts "created tool: #{tool.name}"

user = User.find_by(first_name: 'Jérôme')
tool = Tool.new(
  name: 'Drill',
  category: 'works',
  sub_category: 'powertools',
  daily_price: 14,
  description: 'The most powerfull cordless drill you might find! Brand new, only used twice. Enjoy!',
  condition: 5,
  available: true
)
file = URI.open('https://www.cnet.com/a/img/16qq7d4KRmEimC_1vn_0b4nqLtE=/940x528/2020/12/07/39c983c3-5436-439a-8de5-46e3bdb6c1f0/18v-cordless-drills-8.jpg')
tool.photo.attach(io: file, filename: 'helmet.jpg', content_type: 'image/jpg')
tool.user = user
tool.address = "#{user.address}, #{user.city}"
tool.save!
puts "created tool: #{tool.name}"

user = User.find_by(first_name: 'Jérôme')
tool = Tool.new(
  name: 'Pruning shear',
  category: 'gardening',
  sub_category: 'handtools',
  daily_price: 4,
  description: 'Special hand grip designed for left-handed people. Pair of lopping shears with 30- or 45-cm',
  condition: 4,
  available: true
)
file = URI.open('https://mikesbackyardnursery.com/wp-content/uploads/2016/02/DSC_0007.jpg')
tool.photo.attach(io: file, filename: 'shear.jpg', content_type: 'image/jpg')
tool.user = user
tool.address = "#{user.address}, #{user.city}"
tool.save!
puts "created tool: #{tool.name}"

puts "created #{Tool.count} tools"

# END TOOLS

puts '3. SEED BOOKINGS'
adrien = User.find_by(first_name: 'Adrien')
marion = User.find_by(first_name: 'Marion')
florent = User.find_by(first_name: 'Florent')
jerome = User.find_by(first_name: 'Jérôme')
booking = Booking.new(
  user: marion,
  tool: florent.tools.first,
  date_begin: '01/03/2022',
  date_end: '02/03/2022',
  total_price: 2 * florent.tools.first.daily_price,
  status: 'validated'
)
booking.save!
puts "created booking: #{booking.user.first_name} / #{booking.tool.name}"

booking = Booking.new(
  user: jerome,
  tool: florent.tools.last,
  date_begin: '02/03/2022',
  date_end: '10/03/2022',
  total_price: 9 * florent.tools.last.daily_price,
  status: 'pending'
)
booking.save!
puts "created booking: #{booking.user.first_name} / #{booking.tool.name}"

booking = Booking.new(
  user: florent,
  tool: adrien.tools.last,
  date_begin: '06/03/2022',
  date_end: '10/03/2022',
  total_price: 5 * adrien.tools.last.daily_price,
  status: 'validated'
)
booking.save!
puts "created booking: #{booking.user.first_name} / #{booking.tool.name}"

booking = Booking.new(
  user: adrien,
  tool: jerome.tools.find_by(name: 'Mower'),
  date_begin: '04/03/2022',
  date_end: '15/03/2022',
  total_price: 12 * jerome.tools.find_by(name: 'Mower').daily_price,
  status: 'declined'
)
booking.save!
puts "created booking: #{booking.user.first_name} / #{booking.tool.name}"

booking = Booking.new(
  user: adrien,
  tool: florent.tools.find_by(name: 'Two green screwdrivers'),
  date_begin: '02/03/2022',
  date_end: '03/03/2022',
  total_price: 2 * florent.tools.find_by(name: 'Two green screwdrivers').daily_price,
  status: 'pending'
)
booking.save!
puts "created booking: #{booking.user.first_name} / #{booking.tool.name}"

booking = Booking.new(
  user: adrien,
  tool: jerome.tools.find_by(name: 'Pruning shear'),
  date_begin: '02/03/2022',
  date_end: '03/03/2022',
  total_price: 2 * jerome.tools.find_by(name: 'Pruning shear').daily_price,
  status: 'pending'
)
booking.save!
puts "created booking: #{booking.user.first_name} / #{booking.tool.name}"

booking = Booking.new(
  user: marion,
  tool: florent.tools.find_by(name: 'Two green screwdrivers'),
  date_begin: '05/03/2022',
  date_end: '07/03/2022',
  total_price: 3 * florent.tools.find_by(name: 'Two green screwdrivers').daily_price,
  status: 'declined'
)
booking.save!
puts "created booking: #{booking.user.first_name} / #{booking.tool.name}"

puts "created #{Booking.count} bookings"

puts 'DONE SEEDING'
