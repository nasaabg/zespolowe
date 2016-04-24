Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api, defaults: { format: :json } do
     scope module: :v1 do
      resources :users do
        collection do 
          get 'me', to: "users#me"
        end
      end
     end
   end
end
