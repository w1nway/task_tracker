Rails.application.routes.draw do
  root to: "projects#index"

  resources :projects
  resources :tasks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
