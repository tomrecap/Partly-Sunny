class CreateWeatherConditions < ActiveRecord::Migration
  def change
    create_table :weather_conditions do |t|
      t.string :description, null: false

      t.timestamps
    end
  end
end
