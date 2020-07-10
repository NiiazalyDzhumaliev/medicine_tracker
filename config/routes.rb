Rails.application.routes.draw do
  root "users#show"
  resources :users
  resources :groups do
  resources :medicines, :controller => 'groups/medicines'
  end
  resources :medicines  
  get 'all_medicines', to: 'medicines#all_medicines'
  get  '/login', to: 'sessions#new'
  post  '/login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
