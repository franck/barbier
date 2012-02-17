# encoding: UTF-8
module Prive::Options
  class ParametresController < ApplicationController
    before_filter :load_salon
    
    def index
    end
    
    def update
      if @salon.update_attributes(params[:salon])
        redirect_to prive_options_parametres_path, :notice => "Parametres enregistés"
      else
        render :index
      end
    end
    
  end
end