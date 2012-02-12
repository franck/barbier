Barbier::Application.routes.draw do
  
  match '', to: 'clients#index', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }
  resources :salons

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
  match "/" => redirect("/clients")
  root :to => 'clients#index'

end
