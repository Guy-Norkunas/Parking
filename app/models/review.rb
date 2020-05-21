class Review < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  def save
    super
    self.listing.update_rating
  end
end
