class ListingController < ApplicationController
    def new
        @listing = Listing.new
    end

    def create
        render 'new'
    end
end
