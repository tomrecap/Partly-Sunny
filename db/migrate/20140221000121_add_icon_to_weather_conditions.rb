class AddIconToWeatherConditions < ActiveRecord::Migration
    def self.up
      add_attachment :weather_conditions, :icon
    end

    def self.down
      remove_attachment :weather_conditions, :icon
    end
end
