Rails.application.routes.draw do
  devise_for :passengers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :flights,  only: [:index] do
    collection do
      get :search
    end
    resources :tickets, only: [:index, :show, :new, :create]
  end
  # Defines the root path route ("/")
  root "flights#index"
end
