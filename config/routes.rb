WeatherApp::Application.routes.draw do

  resources :weather_reports, only: [:new, :create]
  resources :cities, only: [:show, :index]

end
