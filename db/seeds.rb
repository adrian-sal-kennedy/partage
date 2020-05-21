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
require 'aws-sdk-s3'
require 'open-uri'

s3 = Aws::S3::Resource.new(region: 'ap-southeast-2')

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

resources.each do |r|
  rez = Resource.create(r.except(:picture))
  path = r[:picture]
  rez.picture.attach(io: URI.open(path), filename: "#{File.extname(path)}")
  resource = Resource.find_by_name(rez[:name])
  puts "Created #{resource.name}!"
end
rez = Resource.create(
  {
      name: 'kitchen space',
      user_id: 1,
      business_id: 2,
      description: 'large category 3 kitchen, time share with small company 3 days/wk',
  }
)
path = 'https://live.staticflickr.com/3850/15222980396_b43578325d_b.jpg'
rez.picture.attach(io: URI.open(path), filename: "#{File.extname(path)}")