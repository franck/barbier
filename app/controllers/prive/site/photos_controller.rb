# encoding: UTF-8
module Prive
  class Site::PhotosController < BaseController
    layout "site"
    
    def index
      @photos = @salon.photos
    end
    
    def new
      @photo = @salon.photos.build
    end
    
    def create
      @photo = @salon.photos.build(params[:photo])
      if @photo.save
        redirect_to prive_site_photos_path
      else
        render :new
      end
    end
    
    def destroy
      photo = @salon.photos.find(params[:id])
      photo.destroy
      redirect_to prive_site_photos_path
    end
    
  end
end