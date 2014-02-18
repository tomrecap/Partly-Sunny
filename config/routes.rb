WeatherApp::Application.routes.draw do
  root to: 'sessions#new'

  resources :weather_reports, only: [:new, :create]
  resources :cities, only: [:show, :index]
  resources :favorite_city_links, only: [:create, :destroy]

  resources :users do #, except: :index do
    get 'activate', on: :collection
  end
  resource :session, only: [:new, :create, :destroy]

end
