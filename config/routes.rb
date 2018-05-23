Rails.application.routes.draw do
  root "welcome#index"

  resources :users, only: [:new]
  resources :ingredients
  resources :recipes do
    resources :recipe_ingredients
  end
  resources :members
  resources :groups do
    resources :group_members
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
