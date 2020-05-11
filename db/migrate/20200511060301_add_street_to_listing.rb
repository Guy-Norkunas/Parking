class AddStreetToListing < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :street, :string
  end
end
