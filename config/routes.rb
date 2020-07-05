Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :groups do
  resources :medicines, :controller => 'groups/medicines'
  end
  resources :medicines  
  get 'all_medicines', to: 'medicines#all_medicines'
  get  '/login', to: 'sessions#new'
  post  '/login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  root "users#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
