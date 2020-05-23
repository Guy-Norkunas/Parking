class UpdateDefaultValutToBooked < ActiveRecord::Migration[6.0]
  def change
    change_column :listings, :booked, :integer, default: -9999
  end
end
