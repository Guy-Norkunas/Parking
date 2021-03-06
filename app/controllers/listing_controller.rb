class ListingController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource

    def index
        @listings = current_user.listings.all
    end

    def new
    end

    def create
        new_listing = current_user.listings.new

        address = get_address
        new_listing.address = address
        location = Geocoder.search(address).first.coordinates

        new_listing.latitude = location[0]
        new_listing.longitude = location[1]

        # complex price calculation algorithm
        new_listing.price = rand(1000..2000)


        permitted = params.require(:other).permit(:description, :picture)

        new_listing.description = permitted[:description]
        new_listing.picture.attach(permitted[:picture])


        if new_listing.save
            redirect_to manage_path
        else
            render 'new'
        end
    end

    def edit
        @listing = Listing.find(params[:id])
    end

    def show
        @listing = Listing.find(params[:id])
        @coordinates = [@listing.latitude, @listing.longitude]
    end

    def delete
        Listing.find(params[:id]).destroy
    end

    def update
        listing = Listing.find(params[:id])

        listing.update(params.require(:listing).permit(:address))

        location = Geocoder.search(listing.address).first.coordinates

        listing.latitude = location[0]
        listing.longitude = location[1]
        

        if listing.save
            redirect_to listing
        else
            render 'edit'
        end
    end

    def change
        listing = Listing.find(params[:id])
        if listing.flip
            redirect_to listing
        else
            redirect_to home_path
        end
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
