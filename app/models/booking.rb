class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  after_save :update_listing

  validates :time, presence: true
  

  def update_listing
    self.listing.booked = Time.now.day*100 + Time.now.hour + self.time 
    self.listing.save
  end

end
