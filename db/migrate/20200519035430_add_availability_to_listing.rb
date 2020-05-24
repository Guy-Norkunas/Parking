class AddAvailabilityToListing < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :available, :boolean, default: false
  end
end
