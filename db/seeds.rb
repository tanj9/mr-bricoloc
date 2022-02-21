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
# Booking.destroy_all

puts "1. seed users"
user = User.new(first_name: 'Marcel',
                last_name: 'Gotlieb',
                address: '1 place du Chatelet',
                city: 'Paris',
                date_of_birth: '07/03/1967',
                email: 'marcel.gotlieb@orange.fr',
                password: '123456'
              )
user.save!

user = User.new(first_name: 'Julia',
                last_name: 'Lewine',
                address: '14 rue des Olympiades',
                city: 'Paris',
                date_of_birth: '22/11/2000',
                email: 'test2@test2.fr',
                password: '123456'
              )
user.save!

user = User.new(first_name: 'Nicolas',
                last_name: 'Lemoine',
                address: '5 rue Saint-Exupéry',
                city: 'Montreuil',
                date_of_birth: '16/07/1994',
                email: 'test3@test3.fr',
                password: '123456'
                )
user.save!

puts "created #{User.count} users"

puts "1. seed tools"
# user = User.find_by(first_name: 'Marcel')
# tool = Tool.new(name: "clef anglaise", category: "travaux", subcategory)

puts "DONE SEEDING"
