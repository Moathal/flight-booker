Rails.application.routes.draw do
  devise_for :views
  devise_for :passangers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "flights#index"
end
