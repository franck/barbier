Barbier::Application.routes.draw do

  resources :options
  resources :clients

  match "/" => redirect("/clients")
  root :to => 'clients#index'

end
