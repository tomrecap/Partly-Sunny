class CreateZipCodes < ActiveRecord::Migration
  def change
    create_table :zip_codes do |t|
      t.integer :zip_code, null: false
      t.string :city, null: false
      t.string :state_name, null: false
      t.string :state_code, null: false
      t.float :longitude, null: false
      t.float :latitude, null:false

      t.timestamps
    end

    add_index :zip_codes, :zip_code, unique: true
    add_index :zip_codes, :city
    add_index :zip_codes, :latitude
    add_index :zip_codes, :longitude
  end
end
