Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'api/auth/registrations'
  }

  namespace :api do
    get '/auth/user', to: 'auth/user/informations#show'

    namespace :v1 do
      namespace :user do
        resources :logs
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
