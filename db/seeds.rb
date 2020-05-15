# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require_relative 'data/users'
require_relative 'data/businesses'
require_relative 'data/resources'

puts 'Seeding Users...'
users.each do |usr|
  usr = User.create(usr)
  puts "Created #{usr[:id]}!"
end
puts "--" * 10 + "\n\n"

puts "Seeding Businesses..."
businesses.each do |biz|
  biz = Business.create(biz)
  puts "Created #{biz[:name]}!"
end
puts "--" * 10 + "\n\n"

puts "Seeding Resources..."
resources.each do |rez|
  rez = Resource.create(rez)
  puts "Created #{rez[:name]}!"
end
