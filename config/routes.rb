Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)
  root "welcome#index"


  namespace :api, defaults: { format: :json } do
    post '/sign_in', to: 'users#create'
    post '/sign_out', to: 'users#sign_out'

    resources :schedules
    resources :carousels

  end

end
