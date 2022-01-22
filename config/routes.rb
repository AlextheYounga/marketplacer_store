Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"

  post "/cart/add/:id" => "cart#add"
  resources :cart, except: [:create, :signup]
  resources :products, except: [:signup]
end
