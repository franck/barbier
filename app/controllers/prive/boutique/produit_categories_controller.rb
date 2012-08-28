# encoding: UTF-8
module Prive
  class Boutique::ProduitCategoriesController < BaseController
    layout "site"
    
    def new
      @produit_category = @salon.produit_categories.build
    end


    def create
      @produit_category = @salon.produit_categories.build(params[:produit_category])
      if @produit_category.save
        redirect_to prive_boutique_produits_path, :notice => 'Catégorie ajoutée'
      else
        render :new
      end
    end

    def edit
      @produit_category = @salon.produit_categories.find(params[:id])
    end

    def update 
      @produit_category = @salon.produit_categories.find(params[:id])
      if @produit_category.update_attributes(params[:produit_category])
        redirect_to prive_boutique_produits_path, :notice => 'Catégorie modifiée'
      else
        render :edit
      end
    end

    def destroy
      @produit_category = @salon.produit_categories.find(params[:id])
      @produit_category.destroy
      redirect_to prive_boutique_produits_path, :notice => 'Catégorie supprimée'
    end

  end
end
