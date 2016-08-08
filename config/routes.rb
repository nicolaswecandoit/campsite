Rails.application.routes.draw do
  devise_for :campeurs
  devise_for :proprietaires
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :villes
  resources :regions
  resources :departements
  resources :campings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#index'
  get '/region/' => 'regions#index'
  get '/departement/' => 'departements#index'
  get '/ville/' => 'villes#index'
  get '/camping/' => 'campings#index'
  get '/profil/' => 'profils#index'
end
