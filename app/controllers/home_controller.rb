class HomeController < ApplicationController
  def index
    visitor_ip = request.remote_ip
    results = Geocoder.search(visitor_ip)
    location = results.first.coordinates
    
    if location.empty?
      @user_location = [1, 1]
    else
      @user_location = location
    end

    @listings = Listing.all
  end
end
