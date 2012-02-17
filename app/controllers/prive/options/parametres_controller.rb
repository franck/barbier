# encoding: UTF-8
module Prive
  class Options::ParametresController < BaseController
    
    def index
    end
    
    def update
      if @salon.update_attributes(params[:salon])
        logger.debug("URL : #{prive_options_parametres_url(:subdomain => @salon.subdomain)}")
        redirect_to prive_options_parametres_url(:subdomain => @salon.subdomain), :notice => "Parametres enregistés"
      else
        render :index
      end
    end
    
  end
end