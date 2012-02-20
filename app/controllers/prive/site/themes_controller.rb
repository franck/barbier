# encoding: UTF-8
module Prive
  class Site::ThemesController < BaseController
    layout "site"
    
    def index
      @themes = @salon.themes
    end
    
    def show
      @theme = @salon.themes.find(params[:id])
    end
    
    def new
      @theme = @salon.themes.build
    end
    
    def create
      @theme = @salon.themes.build(params[:theme])
      if @theme.save
        redirect_to prive_site_themes_path, :notice => "Thème ajouté"
      else
        render :new
      end
    end
    
    def edit
      @theme = @salon.themes.find(params[:id])
    end
    
    def update
      @theme = @salon.themes.find(params[:id])
      if @theme.update_attributes(params[:theme])
        redirect_to prive_site_themes_path, :notice => 'Thème modifié'
      else
        render :edit
      end
    end
    
    def destroy
      theme = @salon.themes.find(params[:id])
      theme.destroy
      redirect_to prive_site_themes_path, :notice => 'Thème supprimé'
    end
    
    def use
      @theme = @salon.themes.find(params[:id])
      @theme.activate
      redirect_to prive_site_themes_path, :notice => 'Thème activé'
    end
    
    def use_default
      Theme.desactivate_all_themes(@salon.id)
      redirect_to prive_site_themes_path, :notice => 'Thème activé'
    end
    
  end
end