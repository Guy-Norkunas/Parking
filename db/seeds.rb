Location_Seeds = ["339, La Trobe St, Melbourne, VIC, 3000", 
                "391, La Trobe St, Melbourne, VIC, 3000", 
                "35, Guildford Ln, Melbourne, VIC, 3000",
                "300, Flanigan Ln, Melbourne, VIC, 3000",
                "336, Elizabeth St, Melbourne, VIC, 3000",
                "445, Elizabeth St, Melbourne, VIC, 3000",
                "18, Anthony St, Melbourne, VIC, 3000",
                "378, La Trobe St, Melbourne, VIC, 3000",
                "192, A'Beckett St, Melbourne, VIC, 3000",
                "249, Franklin St, Melbourne, VIC, 3004",
                ]

User.create(
    email: "admin@admin.com",
    password: "admin123",
    password_confirmation: "admin123",
    admin: true
)

p "Admin created"

3.times do |i|
    User.create(
        email: "#{i}@gmail.com",
        password: "password123",
        password_confirmation: "password123"
    )
end

p "Users created"

i = 2

Location_Seeds.each do |address|
    temp = User.find(i).listings.new
    location = Geocoder.search(address).first.coordinates

    temp.address = address
    temp.latitude = location[0]*(10**7)
    temp.longitude = location[1]*(10**7)
    temp.available = true
    temp.description = Faker::TvShows::RickAndMorty.quote
    temp.save

    if i == 4
        i = 2
    else
        i += 1
    end
end

p "Generated listings"

10.times do 
    Listing.all.each do |listing|
        temp = User.find(rand(2..4)).reviews.new
        temp.review = Faker::Quote.yoda
        temp.listing_id = listing.id
        temp.rating = rand(1..5)
        temp.save
    end
end

p "Added reviews"