Rails.application.routes.draw do
  resources :homes
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root 'homes#index' 
  resources :users, only: :new 
  resources :tweets
end
