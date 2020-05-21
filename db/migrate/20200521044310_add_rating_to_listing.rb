class AddRatingToListing < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :rating, :integer
  end
end
