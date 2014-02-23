class AddCelsiusOptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :celsius, :boolean, null: false, default: false

  end
end
