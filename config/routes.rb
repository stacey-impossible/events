Rails.application.routes.draw do
  devise_for :admins
  root to: 'home#index'
  resources :events,except: [:destroy]
  resources :organizers, only: [:index, :show]
  resources :subscribers, only: [:create]
  get '/export/:id', to: 'events#export'
end
