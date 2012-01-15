Barbier::Application.routes.draw do
  
  constraints lambda { |r| r.domain != SalonVar::DOMAIN || (r.subdomain.present? && r.subdomain != 'www') } do
    match '', to: 'clients#index'
    namespace :options do
      resources :parametres
      resources :sauvegardes do
        collection do
          get 'export'
        end
      end
    end

    resources :clients

    match "/options" => redirect("/options/parametres")
  end
  

  namespace :admin do
    match '/' => redirect("/admin/salons")
    resources :salons
  end

  
  root :to => 'home#index'

end
