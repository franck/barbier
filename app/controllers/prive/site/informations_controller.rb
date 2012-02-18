# encoding: UTF-8
module Prive
  class Site::InformationsController < BaseController
    layout "site"
    
    def index
    end
    
    def update
      if @salon.update_attributes(params[:salon])
        redirect_to prive_site_informations_path, :notice => "Informations mises à jour"
      else
        render :index
      end
    end
    
  end
end