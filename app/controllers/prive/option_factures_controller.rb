# encoding: utf-8
module Prive
  class OptionFacturesController < BaseController

    layout "factures"

    def index
      @category_factures = @salon.category_factures
    end

  end
end
