# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

City.create(name: "New York")
City.create(name: "San Francisco")
City.create(name: "Miami")
City.create(name: "Boston")
City.create(name: "Los Angeles")
City.create(name: "Chicago")

WeatherCondition.create(description: "Windy")
WeatherCondition.create(description: "Rainy")
WeatherCondition.create(description: "Sunny")
WeatherCondition.create(description: "Cloudy")
WeatherCondition.create(description: "Hot")
WeatherCondition.create(description: "Cold")
WeatherCondition.create(description: "Snowing")