Rails.application.routes.draw do
  devise_for :organizers
  root to: 'home#index'
  resources :events, only: [:index, :show, :new, :create]
end
