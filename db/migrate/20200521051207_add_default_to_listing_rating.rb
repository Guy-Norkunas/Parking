class AddDefaultToListingRating < ActiveRecord::Migration[6.0]
  def change
    change_column_default :listings, :rating, 5
  end
end
