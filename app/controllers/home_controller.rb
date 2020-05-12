class HomeController < ApplicationController
  def index
    
    @location = get_user_coordinates
    @listings = Listing.all
  end

  private

  def get_user_coordinates
    visitor_ip = request.remote_ip
    results = Geocoder.search("2001:8003:418a:201:48c1:6e47:2d43:b498")
    location = results.first.address
    city = request.location.city
    p city
  end
end
