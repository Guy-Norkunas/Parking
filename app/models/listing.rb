class Listing < ApplicationRecord
    belongs_to :user
    has_many :reviews
    has_many :bookings
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

    def change
        if self.available
            self.available = false
        else
            self.available = true
        end

        if self.save
            return self
        else
            return home_path
        end
    end

    def update_booking
        return 1
    end
end
