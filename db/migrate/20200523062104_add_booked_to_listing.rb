class AddBookedToListing < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :booked, :integer
  end
end
