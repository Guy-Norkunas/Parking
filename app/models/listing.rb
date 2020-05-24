class Listing < ApplicationRecord
    belongs_to :user
    has_many :reviews
    has_many :bookings
    has_one_attached :picture
    reverse_geocoded_by :latitude, :longitude
    after_validation :reverse_geocode

    def update_rating
        i = 0
        total = 0
        self.reviews.all.each do |review|
            i += 1
            total += review.rating
        end
        self.rating = (total/i).to_i
        self.save
    end

    after_find do |listing|
        if (Time.now.day * 100 + Time.now.hour) < listing.booked
            listing.available = false
        end
    end

    def flip
        if self.available
            self.available = false
        else
            self.available = true
        end

        if self.save
            return true
        else
            return false
        end
    end
end
