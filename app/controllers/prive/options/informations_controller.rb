# encoding: UTF-8
module Prive
  class Options::InformationsController < BaseController
    
    def index
    end
    
    def update
      if @salon.update_attributes(params[:salon])
        redirect_to prive_options_informations_path, :notice => "Informations mises à jour"
      else
        render :index
      end
    end
    
  end
end