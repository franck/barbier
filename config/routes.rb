Barbier::Application.routes.draw do
  
  constraints lambda { |r| r.domain != SalonVar::DOMAIN || (r.subdomain.present? && r.subdomain != 'www') } do
    match '', to: 'accueil#index'  
    
    namespace :prive do
      namespace :site do
        resources :informations
        resource :contact
        resources :photos
        resources :messages do
          member do
            get 'publish'
            get 'unpublish'
          end
        end
        resources :tarifs do
          collection do
            get 'sort'
            post 'reorder'
          end
        end
        resources :tarif_categories do
          collection do
            get 'sort'
            post 'reorder'
          end
        end
        resource :facebook
        resources :themes do
          member do
            get 'use'
          end
          collection do
            get 'use_default'
          end
        end
      end
      match "/site" => redirect("/prive/site/messages")
      
      namespace :options do
        resources :parametres
        match 'facebooks', :to => "facebooks#index"
        resource :facebook, :except => :create do
          get :callback, :to => :create
          collection do
            get 'auth'
            get 'select_page'
            get 'unselect_page'
          end
        end
        resources :sauvegardes do
          collection do
            get 'export'
          end
        end
      end
      match "/options" => redirect("/prive/options/parametres")
      resources :clients
      resources :factures
      
      # sessions
      # resources :sessions
      get '/login', :to => "sessions#index", :as => 'login'
      post '/login', :to => "sessions#create"
      delete '/logout', :to => "sessions#destroy", :as => 'logout'
            
      match '' => redirect("/prive/clients")
    end
  end
  

  namespace :admin do
    match '/' => redirect("/admin/salons")
    resources :salons
  end

  
  root :to => 'home#index'

end
