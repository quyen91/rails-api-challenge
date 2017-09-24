Rails.application.routes.draw do
  # For details on the DSL available within   constraints subdomain: api_subdomain do
    namespace :api do
      namespace :v1 do
        resources :users, only: [:index] do
          collection do
            post :register
          end

          member do
            get :load_posts
          end
        end

        resources :posts, only: [:index, :create, :show] do
          member do
            resources :comments, only: [:index, :create]
          end
        end
      end
    end
end
