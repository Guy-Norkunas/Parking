class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.bigint :longitude
      t.bigint :latitude

      t.timestamps
    end
  end
end
