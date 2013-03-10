RestaurantsApp::Application.routes.draw do
  resources :restaurants
  resources :reviews

  root :to => "restaurants#index"
end
