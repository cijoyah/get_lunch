Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  post 'notifications/notify' => 'notifications#notify'
  
  devise_for :users
  resources :promotions do
    resources :charges
  end

  root 'promotions#index'
end
