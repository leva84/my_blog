Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'articles#index'

  resources :articles, only: %i[index show]
  resource :profile, controller: 'profile', only: :show
end
