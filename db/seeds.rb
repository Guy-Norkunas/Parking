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

3.times do |i|
    User.create(
        email: "#{i}@gmail.com",
        password: "password123",
        password_confirmation: "password123"
    )
end

i = 1

Location_Seeds.each do |address|
    temp = User.find(i).listings.new
    location = Geocoder.search(address).first.coordinates

    temp.address = address
    temp.latitude = location[0]*(10**7)
    temp.longitude = location[1]*(10**7)
    temp.available = true
    temp.save

    if i == 3
        i = 1
    else
        i += 1
    end
end

10.times do 
    Listing.all.each do |listing|
        temp = User.find(rand(1..3)).reviews.new
        temp.review = Faker::Quote.yoda
        temp.listing_id = listing.id
        temp.rating = rand(1..5)
        temp.save
    end
end

