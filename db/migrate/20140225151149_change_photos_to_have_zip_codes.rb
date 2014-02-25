class ChangePhotosToHaveZipCodes < ActiveRecord::Migration
  def up
    add_column :photos, :zip_code_id, :integer
    remove_column :photos, :city_id
  end

  def down
    add_column :photos, :city_id, :integer
    remove_column :photos, :zip_code_id
  end
end
