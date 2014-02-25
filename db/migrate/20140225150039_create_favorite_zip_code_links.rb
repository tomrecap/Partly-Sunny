class CreateFavoriteZipCodeLinks < ActiveRecord::Migration
  def change
    create_table :favorite_zip_code_links do |t|
      t.integer :user_id, null: false
      t.integer :zip_code_id, null: false

      t.timestamps
    end

    add_index :favorite_zip_code_links, :user_id
    add_index :favorite_zip_code_links, [:user_id, :zip_code_id], unique: true
  end
end
