class CreateFavoriteCityLinks < ActiveRecord::Migration
  def change
    create_table :favorite_city_links do |t|
      t.integer :user_id, null: false
      t.integer :city_id, null: false

      t.timestamps
    end

    add_index :favorite_city_links, :user_id
    add_index :favorite_city_links, [:user_id, :city_id], unique: true
  end
end
