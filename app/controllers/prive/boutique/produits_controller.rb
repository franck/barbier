# encoding: utf-8
module Prive
  class Boutique::ProduitsController < BaseController
    layout "boutique"

    def index
      @produits_without_category = Produit.where("produit_category_id is null and salon_id = ?", @salon.id)
      @produit_categories = ProduitCategory.includes(:produits).where("produit_categories.salon_id = ?", @salon.id)
    end

    def new
      @produit = @salon.produits.build
    end

    def create
      @produit = @salon.produits.build(params[:produit])
      if @produit.save
        redirect_to prive_boutique_produits_path
      else
        render :new
      end
    end

    def edit
      @produit = @salon.produits.find(params[:id])
    end

    def update
      @produit = @salon.produits.find(params[:id])
      if @produit.update_attributes(params[:produit])
        redirect_to prive_boutique_produits_path
      else
        render :edit
      end
    end

    def destroy
      produit = @salon.produits.find(params[:id])
      produit.destroy
      redirect_to prive_boutique_produits_path, :notice => "Produit supprimé"
    end

  end
end
