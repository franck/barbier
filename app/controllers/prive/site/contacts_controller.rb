# encoding: UTF-8
module Prive
  class Site::ContactsController < BaseController
    layout "site"
    
    def show
    end
    
    def update
      if @salon.update_attributes(params[:salon])
        redirect_to prive_site_contact_path, :notice => "Données de contact mises à jour"
      else
        render :show
      end
    end
    
  end
end