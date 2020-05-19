class HomeController < ApplicationController

  def index
    @coordinates = get_user_coordinates
    @listings = Listing.all
  end

  private

  def get_user_coordinates
    city = request.location.city
    results = Geocoder.search(city)
    if results.length != 0
      coordinates = results.first.coordinates
    else
      coordinates = Geocoder.search("melbourne").first.coordinates
    end
    
    return coordinates
  end
end
