Rails.application.routes.draw do

  devise_for :users
  resources :promotions

  root 'promotions#index'
end
