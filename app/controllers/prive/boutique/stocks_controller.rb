module Prive
  class StocksController < BaseController
    
    def index
      @produits = @salon.produits.page(params[:page]).per(20)
    end

  end
end
