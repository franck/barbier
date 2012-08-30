# encoding: UTF-8
module Prive
  class Site::TarifCategoriesController < BaseController
    layout "site"
    
    def new
      @tarif_category = @salon.tarif_categories.build
    end
    
    def create
      @tarif_category = @salon.tarif_categories.build(params[:tarif_category])
      if @tarif_category.save
        redirect_to prive_site_tarifs_path, :notice => 'Catégorie ajoutée'
      else
        render :new
      end
    end
    
    def edit
      @tarif_category = @salon.tarif_categories.find(params[:id])
    end
    
    def update
      @tarif_category = @salon.tarif_categories.find(params[:id])
      if @tarif_category.update_attributes(params[:tarif_category])
        redirect_to prive_site_tarifs_path, :notice => 'Catégorie modifiée'
      else
        render :edit
      end
    end
    
    def destroy
      tarif_category = @salon.tarif_categories.find(params[:id])
      tarif_category.destroy
      redirect_to prive_site_tarifs_path, :notice => 'Catégorie supprimée'
    end

    def sort
      @tarif_categories = TarifCategory.order(:position)
    end

    def reorder
      order = params[:category]
      TarifCategory.order!(order)
      render :text => order.inspect
    end
    
  end
end
