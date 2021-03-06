Rails.application.routes.draw do
  root "welcome#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :ingredients
  resources :recipes do
    resources :recipe_ingredients
  end
  resources :members, except: [:destroy]
  resources :groups do
    member do
      post :assign
    end
    resources :group_members
  end

  namespace :leader do
    resources :members, only: [:destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
