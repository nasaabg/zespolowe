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

      resources :questions
     end
   end
end
