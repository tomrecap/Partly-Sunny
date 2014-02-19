WeatherApp::Application.routes.draw do
  root to: 'cities#index'

  resources :weather_reports, only: [:new, :create]
  resources :cities, only: [:show, :index]
  resources :favorite_city_links, only: [:create, :destroy]
  resources :photos do
    resources :comments, only: [:create, :destroy]
    resources :tags, only: [:create, :destroy]
  end

  resources :users do #, except: :index do
    get 'activate', on: :collection
  end
  resource :session, only: [:new, :create, :destroy]

end
