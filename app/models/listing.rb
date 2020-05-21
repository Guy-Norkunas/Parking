class Listing < ApplicationRecord
    belongs_to :user
    has_many :reviews
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

end
