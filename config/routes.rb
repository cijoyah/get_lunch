Rails.application.routes.draw do

  devise_for :businesses
  resources :businesses
  resources :promotions

  root 'promotions#index'
end
