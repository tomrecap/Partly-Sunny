class AddLocationToUser < ActiveRecord::Migration
  def change
    add_column :users, :home_city_id, :integer, null: false
  end
end
