Rails.application.routes.draw do

  # Definierar rutter och root sätter start url.
  root 'pages#home'
  get 'about', to: 'pages#about'

  # Ny väg för att utföra crud på artiklar.
  resources :articles

  # Skapa users
  get 'signup', to: 'users#new'
  resources :users, expect: [:new]  
 
  # Inloggning på sidan
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Kategorier till artiklar, ska ej gå att ta bort.
  resources :categories, expect: [:destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
