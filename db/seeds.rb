# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "START SEEDING"
puts '0. cleaning database'
User.destroy_all
Tool.destroy_all
Booking.destroy_all

puts "1. SEED USERS"
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
tool.photo.attach(io: file, filename: 'adrien.jpg', content_type: 'image/jpg')
user.save!
puts "created user: #{user.first_name}"

user = User.new(
  first_name: 'Marion',
  last_name: 'Rigard',
  address: '14 rue des Olympiades',
  city: 'Paris',
  date_of_birth: '22/11/2000',
  email: 'marion.rigard@gmail.com',
  password: '000000'
)
file = URI.open('https://kitt.lewagon.com/placeholder/users/rigardM')
tool.photo.attach(io: file, filename: 'marion.jpg', content_type: 'image/jpg')
puts "created user: #{user.first_name}"

user = User.new(
  first_name: 'Florent',
  last_name: 'Géron',
  address: '5 rue Saint-Exupéry',
  city: 'Montreuil',
  date_of_birth: '16/07/1994',
  email: 'florent.geron@orange.fr',
  password: '000000'
)
file = URI.open('https://kitt.lewagon.com/placeholder/users/FlorentGeron')
tool.photo.attach(io: file, filename: 'florent.jpg', content_type: 'image/jpg')
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
tool.photo.attach(io: file, filename: 'jerome.jpg', content_type: 'image/jpg')
user.save!
puts "created user: #{user.first_name}"

puts "created #{User.count} users"

puts "2. SEED TOOLS"
user = User.find_by(first_name: 'Florent')
tool = Tool.new(
  name: "Wrench",
  category: "works",
  sub_category: "handtools",
  daily_price: 5,
  description: "Beautiful wrench. Silver color. Brand new. You can have it all weekdays.",
  condition: 5,
  available: true
)
file = URI.open('https://www.sweidas.com.au/assets/full/WE8119.png?20200707031458')
tool.photo.attach(io: file, filename: 'wrench.jpg', content_type: 'image/jpg')
tool.user = user
tool.save!
puts "created tool: #{tool.name}"

tool = Tool.new(
  name: "Ripper",
  category: "works",
  sub_category: "powertools",
  daily_price: 15,
  description: "Rips all you want",
  condition: 3,
  available: true
)
file = URI.open('https://static.lceassets.com/thumbnails/c7/c786d11f6781dcafa5ba8f31450864837abda470/defonceuse-electronique-8mm-1100w-rp1110cj-makita-square-650x650.jpg')
tool.photo.attach(io: file, filename: 'ripper.jpg', content_type: 'image/jpg')
tool.user = user
tool.save!
puts "created tool: #{tool.name}"

tool = Tool.new(
  name: "Two green screwdrivers",
  category: "works",
  sub_category: "handtools",
  daily_price: 1,
  description: "Allow you to screw and unscrew.",
  condition: 1,
  available: false
)
file = URI.open('https://images.tom.shop/producten/original/haba_terra_kids_schroevendraaierset_17_cm_groen_zilver_twee_stuks_239992.jpg')
tool.photo.attach(io: file, filename: 'green_screwdrivers.jpg', content_type: 'image/jpg')
tool.user = user
tool.save!
puts "created tool: #{tool.name}"

tool = Tool.new(
  name: "Hedge trimmer",
  category: "garden",
  sub_category: "motorized",
  daily_price: 15,
  description: "Efficient and easy to use.",
  condition: 3,
  available: true
)
file = URI.open('http://hortimeca.be/102-thickbox_default/taille-haie-echo-xechcr1501.jpg')
tool.photo.attach(io: file, filename: 'hedge_trimmer.jpg', content_type: 'image/jpg')
tool.user = user
tool.save!
puts "created tool: #{tool.name}"

user = User.find_by(first_name: 'Marion')
tool = Tool.new(
  name: "Shovel",
  category: "garden",
  sub_category: "handtools",
  daily_price: 5,
  description: "Oh so beautiful. Golden color.",
  condition: 4,
  available: true
)
file = URI.open('https://cdn.shopify.com/s/files/1/0294/0862/4685/products/Gold-Painted-Groundbreaking-Shovel-Black-Handle_800x.png')
tool.photo.attach(io: file, filename: 'shovel.jpg', content_type: 'image/jpg')
tool.user = user
tool.save!
puts "created tool: #{tool.name}"

puts "created #{Tool.count} tools"

puts "3. SEED BOOKINGS"
adrien = User.find_by(first_name: 'Adrien')
marion = User.find_by(first_name: 'Marion')
florent = User.find_by(first_name: 'Florent')
jerome = User.find_by(first_name: 'Jérôme')
booking = Booking.new(
  user: marion,
  tool: florent.tools.first,
  date_begin: "01/03/2022",
  date_end: "02/03/2022",
  total_price: 2 * florent.tools.first.daily_price,
  status: "pending"
)
booking.save!
puts "created booking: #{booking.user.first_name} / #{booking.tool.name}"

booking = Booking.new(
  user: jerome,
  tool: florent.tools.last,
  date_begin: "02/03/2022",
  date_end: "10/03/2022",
  total_price: 9 * florent.tools.last.daily_price,
  status: "pending"
)
booking.save!
puts "created booking: #{booking.user.first_name} / #{booking.tool.name}"

booking = Booking.new(
  user: adrien,
  tool: marion.tools.last,
  date_begin: "06/03/2022",
  date_end: "10/03/2022",
  total_price: 5 * marion.tools.last.daily_price,
  status: "validated"
)
booking.save!
puts "created booking: #{booking.user.first_name} / #{booking.tool.name}"

booking = Booking.new(
  user: adrien,
  tool: florent.tools.find_by(name: 'Ripper'),
  date_begin: "04/03/2022",
  date_end: "15/03/2022",
  total_price: 12 * florent.tools.find_by(name: 'Ripper').daily_price,
  status: "validated"
)
booking.save!
puts "created booking: #{booking.user.first_name} / #{booking.tool.name}"

booking = Booking.new(
  user: jerome,
  tool: florent.tools.find_by(name: 'Two green screwdrivers'),
  date_begin: "02/03/2022",
  date_end: "03/03/2022",
  total_price: 2 * florent.tools.find_by(name: 'Two green screwdrivers').daily_price,
  status: "validated"
)
booking.save!
puts "created booking: #{booking.user.first_name} / #{booking.tool.name}"

booking = Booking.new(
  user: marion,
  tool: florent.tools.find_by(name: 'Two green screwdrivers'),
  date_begin: "05/03/2022",
  date_end: "07/03/2022",
  total_price: 3 * florent.tools.find_by(name: 'Two green screwdrivers').daily_price,
  status: "validated"
)
booking.save!
puts "created booking: #{booking.user.first_name} / #{booking.tool.name}"

puts "created #{Booking.count} bookings"

puts "DONE SEEDING"
