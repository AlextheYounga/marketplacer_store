Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
  get "/cart" => "checkout#cart"
  post "/cart/add/:id" => "checkout#add"
  
  resources :products, except: [:signup]
end
