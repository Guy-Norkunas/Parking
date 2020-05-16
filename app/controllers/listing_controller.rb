class ListingController < ApplicationController
    def new
    end

    def create
        new_listing = Listing.new

        address = get_address
        new_listing.address = address
        location = Geocoder.search(address).first.coordinates
        new_listing.latitude = location[0]*(10**7)
        new_listing.longitude = location[1]*(10**7)
        new_listing.save

        redirect_to home_path
    end

    private
        def get_address
            permitted = params.require("address").permit("street_number", "street", "city", "state", "postcode", "country")
            address = [permitted["street_number"], 
                        permitted["street"],
                        permitted["city"],
                        permitted["country"]]
            return address.compact.join(', ')
            
        end
end
