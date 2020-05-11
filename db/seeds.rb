# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do 
    temp = Listing.new
    location = Geocoder.search(Faker::Address.country).first.coordinates
    temp.latitude = location[0]*(10**7)
    temp.longitude = location[1]*(10**7)
    temp.save
end