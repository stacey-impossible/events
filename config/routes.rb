Rails.application.routes.draw do
  devise_for :admins
  root to: 'home#index'
  resources :events, only: [:index, :show, :new, :create]
  resources :organizers, only: [:index, :show]
end
