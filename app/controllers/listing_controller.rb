class ListingController < ApplicationController
    def new
        @listing = Listing.new
    end

    def create
        permitted = params.require("address").permit("street_number", "street", "city", "state", "postcode", "country")
        p permitted["street"]
        redirect_to home_path
    end
end
