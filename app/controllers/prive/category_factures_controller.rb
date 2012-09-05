module Prive
  class CategoryFacturesController < BaseController

    layout "factures"

    def new
      @category_facture = @salon.category_factures.build
    end

    def create
      @category_facture = @salon.category_factures.build(params[:category_facture])
      if @category_facture.save
        redirect_to prive_option_factures_path
      else
        render :new
      end
    end

    def destroy
      category_facture = @salon.category_factures.find(params[:id])
      category_facture.destroy
      redirect_to prive_option_factures_path
    end
  end
end
