Barbier::Application.routes.draw do
  
  match '', to: 'clients#index', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }

  namespace :admin do
    match '/' => redirect("/admin/salons")
    resources :salons
  end

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
  root :to => 'home#index'

end
