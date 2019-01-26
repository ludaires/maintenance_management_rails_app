Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#home'

  resources :users do 
    resources :codes, only: [:new, :index, :show]
    resources :parts, only: [:new, :index]
    resources :equipment, only: [:new, :index]
  end
  
  resources :maintenances do 
    # resources :inspections, only: [:show, :index]
    resources :inspections
  end

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  # delete '/inspections/:id/delete' => 'inspections#destroy'






end
