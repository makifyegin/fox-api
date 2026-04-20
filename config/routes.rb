Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      # Routes will come here
      resources :bookings, only: [:create, :index]
      resources :regions, only: [] do
        resources :availabilities, only: [:index], controller: 'public_availabilities'
      end
      get "profile" => "profile#show", as: :rails_profile
      resources :availabilities, only: [:index, :create, :destroy]

      post "login", to: "auth#login"
      resources :countries, only: [:index], param: :code do
        resources :regions, only: [:index]
      end
    end
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
