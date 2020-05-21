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
usr = User.create(
  {
    name: 'bogey mcboagface',
    position: 'booger officer',
    email: 'bogan@bogan.com',
    password: 'password',
  }
)
puts "--" * 10 + "\n\n"

puts "Seeding Businesses..."
businesses.each do |biz|
  biz = Business.create(biz)
  business = Business.find_by_name(biz[:name])
  puts "Created #{business.name}!"
end
biz = Business.create(
  {
    name: 'The Russian Pty Ltd',
    url: 'www.therussian.com.au',
    location: '355 Springvale Rd, Springvale VIC 3171',
    description: "don't know what he does.",
    user_id: 2
  }
)
puts "--" * 10 + "\n\n"

puts "Seeding Resources..."
resources.each do |rez|
  rez = Resource.create(rez)
  resource = Resource.find_by_name(rez[:name])
  puts "Created #{resource.name}!"
end
rez = Resource.create(
  {
      name: 'kitchen space',
      user_id: 1,
      business_id: 2,
      description: 'large category 3 kitchen, time share with small company 3 days/wk',
      picture: 'https://live.staticflickr.com/3850/15222980396_b43578325d_b.jpg'
  }
)
rez = Resource.create({
  name: 'PA system. only used thursdays',
  user_id: 1,
  business_id: 5,
  description: "I do karaoke sessions at pubs, but for the moment i'm only doing thursdays so it's available for hire.\r\n\r\nincludes TV, mixer, 2x foldbacks, 2x 200watt PA units and stands.\r\n\r\ndon't break it please.",
  picture: "https://cdn.djcity.com.au/wp-content/uploads/2017/11/29105026/170103_side1-500x500.jpg"
  }
)