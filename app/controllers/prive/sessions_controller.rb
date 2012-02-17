module Prive
  class SessionsController < ApplicationController
    before_filter :load_salon
    
    layout "login"
    
    def index
    end
    
    def create
      if @salon.authenticate(params[:password])
        session[:salon_id] = @salon.id
        redirect_to prive_path
      else
        redirect_to prive_login_path, :alert => "Mauvais mot de passe"
      end
    end
    
    def destroy
      session[:salon_id] = nil
      @current_user = nil
      redirect_to root_path
    end
    
  end
end