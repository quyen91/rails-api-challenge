Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  api_subdomain = 'api'
  constraints subdomain: api_subdomain do

    namespace :api, path: nil do
      namespace :v1 do
        resources :users, only: [:index] do
          collection do
            post :register
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
end
