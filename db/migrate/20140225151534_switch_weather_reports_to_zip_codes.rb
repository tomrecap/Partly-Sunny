class SwitchWeatherReportsToZipCodes < ActiveRecord::Migration
  def up
    add_column :weather_reports, :zip_code_id, :integer
    remove_column :weather_reports, :city_id
  end

  def down
    add_column :weather_reports, :city_id, :integer
    remove_column :weather_reports, :zip_code_id
  end
end
