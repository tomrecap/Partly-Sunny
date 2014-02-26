WeatherApp::Application.routes.draw do
  root to: 'zip_codes#index'

  resources :weather_reports, only: [:new, :create] do
    post "create_with_photo", on: :collection
  end

  # resources :cities, only: [:show, :index] do
  #   resource :gallery, only: :show
  #   get "search", on: :collection
  # end

  resources :zip_codes, only: [:show, :index] do
    resource :gallery, only: :show
    get "search", on: :collection
  end

  # resources :favorite_city_links, only: [:create, :destroy]

  resources :favorite_zip_code_links, only: [:create, :destroy] do
    post "modify", on: :collection
    delete "modify", on: :collection
  end


  resources :favorite_user_links, only: [:create, :destroy]
  resources :photos do
    resources :comments, only: [:create, :destroy]
    resources :tags, only: [:create, :destroy]
  end

  resources :users do
    get 'activate', on: :collection
    get 'dashboard', on: :member
    resource :gallery, only: :show
  end

  resources :tags, only: [:create, :destroy] do
    resource :gallery, only: :show
  end

  resource :session, only: [:new, :create, :destroy]
  get "auth/twitter/callback" => "sessions#create"
end
