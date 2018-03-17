Rails.application.routes.draw do

  # Definierar rutter och root sätter start url.
  root 'pages#home'
  get 'about', to: 'pages#about'

  # Ny väg för att utföra crud på artiklar.
  resources :articles

  get 'signup', to: 'users#new'
  resources :users, expect: [:new]  
  #post 'users', to: 'users#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
