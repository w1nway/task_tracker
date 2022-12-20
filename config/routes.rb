Rails.application.routes.draw do
  root to: "projects#index"

  resources :projects do
    resources :tasks
  end

  resources :users, only: %i[new create]
  resource :sessions, only: %i[new create show destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
