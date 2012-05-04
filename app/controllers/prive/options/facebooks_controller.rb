# encoding: UTF-8
require 'rack/oauth2'

module Prive
  class Options::FacebooksController < BaseController
    layout "options"
    
    before_filter :get_fb_user, :only => [:index, :select_page, :unselect_page]
    #rescue_from OAuthException, :with => :oauth2_error
    #rescue_from Rack::OAuth2::Client::Error, :with => :oauth2_error
    rescue_from FbGraph::Unauthorized, :with => :oauth2_error
    
    def index
      if @fb_user
        @user = FbGraph::User.new(@fb_user.identifier, :access_token => @fb_user.access_token).fetch 
        if @user && !@fb_user.page_name.present?
          @pages = @user.accounts
        end
      end
    end
    
    def auth
      auth = FacebookAccount.auth.from_cookie(cookies)
      FacebookAccount.identify(auth.user, @salon.id)
      redirect_to prive_options_facebooks_path, :notice => 'La page facebook est liée au compte'
    end
    
    # handle Normal OAuth flow: start
    def new
      client = FacebookAccount.auth(callback_prive_options_facebook_url).client
      redirect_to client.authorization_uri(:scope => SalonVar::FACEBOOK_SCOPE)
    end

    # handle Normal OAuth flow: callback
    def create
      client = FacebookAccount.auth(callback_prive_options_facebook_url).client
      client.authorization_code = params[:code]
      access_token = client.access_token!
      user = FbGraph::User.me(access_token).fetch
      FacebookAccount.identify(user, @salon.id)
      redirect_to prive_options_facebooks_path, :notice => "La page facebook est liée au compte"
    end
    
    def update
      if @salon.update_attributes(params[:facebook])
        redirect_to prive_options_facebooks_path, :notice => "Mis à jour"
      else
        render :index
      end
    end
    
    def destroy
      @fb_user = FacebookAccount.where(:salon_id => @salon.id).first
      @fb_user.destroy
      redirect_to prive_options_facebooks_path
    end
    
    def select_page
      @page = FbGraph::Page.fetch(params[:page_id])
      @fb_user.update_page!(@page, params[:page_access_token])
      redirect_to prive_options_facebooks_path
    end
    
    def unselect_page
      @fb_user.remove_page!
      redirect_to prive_options_facebooks_path
    end
    
    private

    def get_fb_user
      @fb_user = FacebookAccount.where(:salon_id => @salon.id).first
    end
    
    def oauth2_error(e)
      logger.debug("ERROR MESSAGE : #{e.message}")
      if e.message =~/Error validating access token/
        logger.debug("ERROR ACCESS TOKEN")
        redirect_to new_prive_options_facebook_path, :alert => "Erreur Facebook : la connexion a été interrompue"
      else
        redirect_to prive_options_parametres_path, :alert => "Erreur Facebook : #{e.message}"
      end
    end

  end
end
