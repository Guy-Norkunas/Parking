class HomeController < ApplicationController
  

  def index
    @coordinates = get_user_coordinates
    @listings = []
    Listing.all.each do |listing|
      if listing.distance_to(@coordinates, :km) < 100000 && listing.available
        @listings << listing
      end
    end
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
