class SearchController < ApplicationController
    def index
    end

    def search
        address = get_address
        @listings = []
        @coordinates = Geocoder.search(address).first.coordinates

        Listing.all.each do |listing|
            if listing.distance_to(@coordinates, :km) < 100000 && listing.available
                @listings << listing
            end
        end
    end

    private
        def search_params

        end

        def get_address
            permitted = params.require("address").permit("street_number", "street", "city", "state", "postcode", "country")
            address = [permitted["street_number"], 
                        permitted["street"],
                        permitted["city"],
                        permitted["country"]]
            return address.compact.join(', ')
        end
end
