# encoding: UTF-8
require 'rack/oauth2'

module Prive
  class Site::MessagesController < BaseController
    layout "site"
    
    rescue_from FbGraph::Exception, :with => :oauth2_error
    
    def index
      @messages = @salon.messages
    end
    
    def new
      @message = @salon.messages.build
    end
    
    def create
      @message = @salon.messages.build(params[:message])
      if @message.save
        @message.send_to_facebook
        redirect_to prive_site_messages_path, :notice => 'Message ajouté'
      else
        render :new
      end
    end
    
    def edit
      @message = @salon.messages.find(params[:id])
    end
    
    def update
      @message = @salon.messages.find(params[:id])
      if @message.update_attributes(params[:message])
        @message.send_to_facebook
        redirect_to prive_site_messages_path, :notice => 'Message modifié'
      else
        render :edit
      end
    end
    
    def destroy
      message = @salon.messages.find(params[:id])
      message.destroy
      redirect_to prive_site_messages_path, :notice => 'Message supprimé'
    end
    
    private
    
    def oauth2_error(e)
      logger.debug("ERROR MESSAGE : #{e.message}")
      if e.message =~/Error validating access token/
        logger.debug("ERROR ACCESS TOKEN")
        redirect_to new_prive_options_facebook_path
      else
        redirect_to prive_site_messages_path, :alert => "Erreur Facebook : #{e.message}"
      end
    end
    
  end
end