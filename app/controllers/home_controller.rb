class HomeController < ApplicationController
  def index
    visitor_ip = request.remote_ip
    results = Geocoder.search(visitor_ip)
    @user_location = results.first.coordinates
    @listings = Listing.all
  end
end
