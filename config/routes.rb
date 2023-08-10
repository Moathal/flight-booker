Rails.application.routes.draw do
  devise_for :passengers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :flights,  only: [:index] do
    collection do
      get :search
    end
  end
  # Defines the root path route ("/")
  root "flights#index"
end
