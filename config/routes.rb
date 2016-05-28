Rails.application.routes.draw do
  apipie
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api, defaults: { format: :json } do
    scope module: :v1 do
      resources :users, only: [:show, :index] do
        collection do
          get 'me', to: "users#me"
        end
      end

      resources :questions do
        resources :comments, only: [:index, :show, :create]
        resources :answers do
          resources :comments, only: [:index, :show, :create]
          member do
            post "accept", to: "answers#accept"
            post "add_point", to: "answers#add_point"
            post "remove_point", to: "answers#remove_point"
          end
        end
        member do
          post "add_point", to: "questions#add_point"
          post "remove_point", to: "questions#remove_point"
        end
        collection do
          get "taggable", to: "questions#taggable"
        end
      end

      resources :tags, only: [:index] do
        collection do
          get "least-used", to: "tags#least_used"
          get "most-used", to: "tags#most_used"
        end
      end
    end
   end
end
