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
user = User.new(first_name: 'Marcel',
                last_name: 'Gotlieb',
                address: '1 place du Chatelet',
                city: 'Paris',
                date_of_birth: '07/03/1967',
                email: 'marcel.gotlieb@orange.fr',
                password: '123456'
               )
user.save!
puts "created user: #{user.first_name}"

user = User.new(first_name: 'Julia',
                last_name: 'Lewine',
                address: '14 rue des Olympiades',
                city: 'Paris',
                date_of_birth: '22/11/2000',
                email: 'test2@test2.fr',
                password: '123456'
               )
user.save!
puts "created user: #{user.first_name}"

user = User.new(first_name: 'Nicolas',
                last_name: 'Lemoine',
                address: '5 rue Saint-Exupéry',
                city: 'Montreuil',
                date_of_birth: '16/07/1994',
                email: 'test3@test3.fr',
                password: '123456'
                )
user.save!
puts "created user: #{user.first_name}"

puts "created #{User.count} users"

puts "2. SEED TOOLS"
user = User.find_by(first_name: 'Marcel')
tool = Tool.new(name: "clef anglaise",
                category: "travaux",
                sub_category: "travaux1",
                daily_price: 5,
                description: "Magnifique clé. Couleur rouge. Neuve.",
                condition: 5,
                available: true
               )
tool.user = user
tool.save!
puts "created tool: #{tool.name}"

tool = Tool.new(name: "défonceuse",
                category: "travaux",
                sub_category: "travaux2",
                daily_price: 15,
                description: "Défonce tout.",
                condition: 3,
                available: true
               )
tool.user = user
tool.save!
puts "created tool: #{tool.name}"

tool = Tool.new(name: "tournevis",
                category: "travaux",
                sub_category: "travaux3",
                daily_price: 1,
                description: "Permet de visser et aussi de dévisser!",
                condition: 1,
                available: false
               )
tool.user = user
tool.save!
puts "created tool: #{tool.name}"

user = User.find_by(first_name: 'Julia')
tool = Tool.new(name: "tournevis",
                category: "travaux",
                sub_category: "travaux3",
                daily_price: 1,
                description: "Permet de visser et aussi de dévisser!",
                condition: 1,
                available: false
               )
tool.user = user
tool.save!
puts "created tool: #{tool.name}"
puts "created #{Tool.count} tools"

puts "3. SEED BOOKINGS"
marcel = User.find_by(first_name: 'Marcel')
julia = User.find_by(first_name: 'Julia')
nicolas = User.find_by(first_name: 'Nicolas')
booking = Booking.new(user: julia,
                      tool: marcel.tools.first,
                      date_begin: "01/03/2022",
                      date_end: "02/03/2022",
                      # total_price: 2 * marcel.tools.first.daily_price,
                      status: "pending"
                     )
booking.save!
puts "created booking: #{booking.user.first_name} / #{booking.tool.name}"

booking = Booking.new(user: nicolas,
                      tool: marcel.tools.last,
                      date_begin: "02/03/2022",
                      date_end: "10/03/2022",
                      # total_price: 9 * marcel.tools.last.daily_price,
                      status: "pending"
                     )
booking.save!
puts "created booking: #{booking.user.first_name} / #{booking.tool.name}"

booking = Booking.new(user: nicolas,
                      tool: julia.tools.last,
                      date_begin: "06/03/2022",
                      date_end: "10/03/2022",
                      # total_price: 5 * julia.tools.last.daily_price,
                      status: "validated"
                     )
booking.save!
puts "created booking: #{booking.user.first_name} / #{booking.tool.name}"

puts "created #{booking.count} bookings"

puts "DONE SEEDING"
