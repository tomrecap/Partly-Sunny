class CreateWeatherReports < ActiveRecord::Migration
  def change
    create_table :weather_reports do |t|
      t.integer :temperature, null: false
      t.integer :city_id, null: false
      t.integer :weather_condition_id, null: false

      t.timestamps
    end

    add_index :weather_reports, :city_id
  end
end
