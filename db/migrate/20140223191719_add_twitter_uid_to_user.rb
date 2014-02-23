class AddTwitterUidToUser < ActiveRecord::Migration
  def up
    add_column :users, :uid, :integer
    change_column :users, :email, :string, null: true
    change_column :users, :home_city_id, :integer, null: true
  end

  def down
    remove_column :users, :uid, :integer
    change_column :users, :email, :string, null: false
    change_column :users, :home_city_id, :integer, null: false
  end
end
