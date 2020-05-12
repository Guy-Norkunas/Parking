class HomeController < ApplicationController
  def index
    
    @coordinates = get_user_coordinates
    @listings = Listing.all
  end

  private

  def get_user_coordinates
    city = request.location.city
    results = Geocoder.search(city)
    coordinates = results.first.coordinates
    
    return coordinates
  end
end
