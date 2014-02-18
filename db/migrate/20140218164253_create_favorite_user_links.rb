class CreateFavoriteUserLinks < ActiveRecord::Migration
  def change
    create_table :favorite_user_links do |t|
      t.integer :favoriter_id, null: false
      t.integer :favorited_id, null: false

      t.timestamps
    end

    add_index :favorite_user_links, :favoriter_id
    add_index :favorite_user_links, [:favoriter_id, :favorited_id], unique: true
  end
end
