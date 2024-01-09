Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: {format: :json} do
    namespace :v1 do

      #post 'organization/companies', to: "organizations#check_organization"
      #get '/avatars', to: "organizations#get_avatars"

      devise_scope :user do
        post "users/login", to: "sessions#create"
        post "stores/login", to: "sessions#create_store_session"
        delete "logout", to: 'sessions#destroy'
        post "auth_token_signin", to: "sessions#user_token_signin"
        post "users/login/okta", to: "sessions#create_okta_signin"
      end
    end
  end
end
