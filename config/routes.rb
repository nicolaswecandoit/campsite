Rails.application.routes.draw do

  resources :post_attachments
  get 'home/index'

  devise_for :users
  devise_for :campeurs
  devise_for :proprietaires
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :villes
  resources :regions
  resources :departements
  resources :campings
  

  resources :notifications do
     collection do
       post :mark_as_read
     end
   end
  
  
  resources :conversations do
  resources :messages
 end
 
 resources :campings do
  resources :comments
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'campings#homesearch'
  get '/result/' => 'campings#result'
  get '/resultnohome/' => 'campings#resultnohome'
  get '/region/' => 'regions#index'
  get '/departement/' => 'departements#index'
  get '/ville/' => 'villes#index'
  get '/camping/' => 'campings#index'
  #Ajout user
  get '/profil/' => 'users#index' 
  get '/profil/mon-camping' => 'users#moncamping'
  
  get '/connexion/' => 'profils#index'
  get '/search/' => 'search#search'

end
