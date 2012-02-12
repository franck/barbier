# encoding: utf-8
module Admin
  class SalonsController < ApplicationController
  
    layout "admin"
  
    def index
      @salons = Salon.all
    end
  
    def new
      @salon = Salon.new
    end
    
    def create
      @salon = Salon.new(params[:salon])
      if @salon.save
        redirect_to admin_salons_path, :notice => "Salon crée"
      else
        render :new
      end
    end
  
    def edit
      @salon = Salon.find(params[:id])
    end
  
    def update
      @salon = Salon.find(params[:id])
      if @salon.update_attributes(params[:salon])
        redirect_to admin_salons_path, :notice => "Salon modifié"
      else
        render :edit
      end
    end
  
    def destroy
      salon = Salon.find(params[:id])
      salon.destroy
      redirect_to admin_salons_path, :notice => "Salon supprimé"
    end
  
  end
end