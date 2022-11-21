Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  root to: "projects#index"

  resources :projects do
    resources :tasks do
      resources :comments, only: %i[create destroy edit update]
    end
  end

  resources :users, only: %i[new create]
  resource :sessions, only: %i[new create show destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
