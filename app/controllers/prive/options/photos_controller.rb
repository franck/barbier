# encoding: UTF-8
module Prive
  class Options::PhotosController < BaseController
    layout "options"
    
    def index
    end
    
    def new
      @photo = @salon.photos.build
    end
    
    def create
    end
    
    def destroy
    end
    
  end
end