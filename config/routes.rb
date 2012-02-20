Barbier::Application.routes.draw do
  
  constraints lambda { |r| r.domain != SalonVar::DOMAIN || (r.subdomain.present? && r.subdomain != 'www') } do
    match '', to: 'accueil#index'
    
    namespace :prive do
      namespace :site do
        resources :informations
        resources :photos
        resources :messages
        resources :tarifs
      end
      match "/site" => redirect("/prive/site/messages")
      
      namespace :options do
        resources :parametres  
        resources :sauvegardes do
          collection do
            get 'export'
          end
        end
      end
      match "/options" => redirect("/prive/options/parametres")
      resources :clients
      
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
