class AddDefaultValueToBooked < ActiveRecord::Migration[6.0]
  def change
    change_column :listings, :booked, :integer, default: 0000
  end
end
