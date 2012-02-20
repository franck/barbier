# encoding: UTF-8
module Prive
  class Site::MessagesController < BaseController
    layout "site"
    
    def index
      @messages = @salon.messages
    end
    
    def new
      @message = @salon.messages.build
    end
    
    def create
      @message = @salon.messages.build(params[:message])
      if @message.save
        redirect_to prive_site_messages_path
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
        redirect_to prive_site_messages_path
      else
        render :edit
      end
    end
    
    def destroy
      message = @salon.messages.find(params[:id])
      message.destroy
      redirect_to prive_site_messages_path
    end
    
  end
end