Rails.application.routes.draw do

  resources :businesses
  resources :promotions

  root 'promotions#index'
end
