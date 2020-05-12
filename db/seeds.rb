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

Location_Seeds.each do |address|
    temp = Listing.new
    
    location = Geocoder.search(address).first.coordinates

    temp.address = address
    temp.latitude = location[0]*(10**7)
    temp.longitude = location[1]*(10**7)
    temp.save
end

