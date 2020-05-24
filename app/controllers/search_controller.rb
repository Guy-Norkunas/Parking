class SearchController < ApplicationController
    def index
    end

    def search
        @listings = []
        address = get_address
        @coordinates = Geocoder.search(address).first.coordinates
        Listing.all.each do |listing|
            if check_listing(listing, @coordinates)
                @listings << listing
            end
        end
    end

    private
        def check_listing(listing, coordinates)

            permitted = params.require("search").permit("distance", "rating")

            distance = permitted["distance"].to_i
            rating = permitted["rating"].to_i

            if (listing.distance_to(coordinates, :km) <= (distance) && 
                listing.rating >= rating &&
                listing.available)
                return true
            else
                return false
            end
        end

        def get_address
            permitted = params.require("search").permit("street_number", "street", "city", "state", "postcode", "country")
            address = [permitted["street_number"], 
                        permitted["street"],
                        permitted["city"],
                        permitted["country"]]
            return address.compact.join(', ')
        end
end
