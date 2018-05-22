Rails.application.routes.draw do
  resources :ingredients
  resources :recipes do
    resources :recipe_ingredients
  end
  resources :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
