class Review < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :review, presence: true
  validates :rating, presence: true
  validates :rating, numericality: {greater_than_or_equal_to: 0, less_thatn_or_equal_to: 5}

  def save
    super
    self.listing.update_rating
  end
end
