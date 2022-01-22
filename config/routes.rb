Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"

  post "/cart/add/:id" => "cart#add"
  post "/cart/promotion/" => "cart#check_discount_code"

  resources :cart, except: [:create, :signup]
  resources :products, except: [:signup]
end
