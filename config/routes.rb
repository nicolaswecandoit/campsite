Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  get 'home/index'

  devise_for :campeurs
  devise_for :proprietaires
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :villes
  resources :regions
  resources :departements
  resources :campings

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'campings#homesearch'
  get '/result/' => 'campings#result'
  get '/resultnohome/' => 'campings#resultnohome'
  get '/region/' => 'regions#index'
  get '/departement/' => 'departements#index'
  get '/ville/' => 'villes#index'
  get '/camping/' => 'campings#index'
  get '/profil-proprietaire/' => 'proprietaires#index'
  get '/profil-proprietaire/mon-camping' => 'proprietaires#moncamping'
  get '/profil-campeur/' => 'campeurs#index'
  get '/connexion/' => 'profils#index'
  get '/search/' => 'search#search'
end
