# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = []
listings = []

100.times do |n|
    u = User.create!(
        username: Faker::Name.first_name, 
        email: Faker::Internet.unique.email, 
        password: '123456', 
        password_confirmation: '123456')
    users.push(u.id)
    
    50.times do |n|
        l = Listing.create!(
            user_id: u.id,
            title: 'hi', 
            price: 3, 
            available_swipes: 100,
            location: 1,
            description: 'test')
        listings.push(l.id)
    end	
end