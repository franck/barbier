# encoding: UTF-8
module Prive
  class Site::FacebooksController < BaseController
    layout "site"
    
    def show
      @facebook_account = @salon.facebook_account
    end
    
    def update
      if @salon.update_attributes(params[:salon])
        redirect_to prive_site_facebook_path, :notice => "Choix enregistrer"
      else
        render :index
      end
    end
    
  end
end