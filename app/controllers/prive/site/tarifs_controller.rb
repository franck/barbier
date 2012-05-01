# encoding: UTF-8
module Prive
  class Site::TarifsController < BaseController
    layout "site"
    
    def index
      # @tarifs = @salon.tarifs
      @tarif_categories = TarifCategory.includes(:tarifs).where("tarif_categories.salon_id = ?", @salon.id).order(:position)
      @tarifs_without_category = Tarif.where("tarif_category_id is null and salon_id = ?", @salon.id)
    end
    
    def new
      @tarif = @salon.tarifs.build
    end
    
    def create
      @tarif = @salon.tarifs.build(params[:tarif])
      if @tarif.save
        redirect_to prive_site_tarifs_path, :notice => 'Tarif ajouté'
      else
        render :new
      end
    end
    
    def edit
      @tarif = @salon.tarifs.find(params[:id])
    end
    
    def update
      @tarif = @salon.tarifs.find(params[:id])
      if @tarif.update_attributes(params[:tarif])
        redirect_to prive_site_tarifs_path, :notice => 'Tarif modifié'
      else
        render :edit
      end
    end
    
    def destroy
      tarif = @salon.tarifs.find(params[:id])
      tarif.destroy
      redirect_to prive_site_tarifs_path, :notice => 'Tarif supprimé'
    end
    
  end
end
