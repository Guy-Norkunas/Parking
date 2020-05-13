class AddStreetToListing < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :address, :string
  end
end
