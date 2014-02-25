class ChangeUserCityKeysToZipCodeKeys < ActiveRecord::Migration
  def up
    add_column :users, :home_zip_code_id, :integer
    remove_column :users, :home_city_id
  end

  def down
    remove_column :users, :home_zip_code_id
    add_column :users, :home_city_id, :integer
  end
end
