# encoding: utf-8
module Prive
  class ClientsController < BaseController
  
    def index
      @birthday_customers = @salon.clients.has_is_birthday_this_week
      @birthday_customers_grouped_by_dates = @salon.clients.has_is_birthday_this_week_grouped_by_date_and_sorted 
      @clients = @salon.clients.search(params[:search]).paginate(:page => params[:page], :per_page => 20)
    end
  
    def show
      @client = @salon.clients.find(params[:id])
      @factures = @client.factures
    end
  
    def new
      @client = @salon.clients.build
    end
  
    def create
      @client = @salon.clients.build(params[:client])
      if @client.save
        redirect_to prive_client_path(@client)
      else
        render :new
      end
    end
  
    def edit
      @client = @salon.clients.find(params[:id])
    end
  
    def update
      @client = @salon.clients.find(params[:id])
      if @client.update_attributes(params[:client])
        redirect_to prive_client_path(@client)
      else
        render :edit
      end
    end
  
    def destroy
      client = @salon.clients.find(params[:id])
      client.destroy
      redirect_to prive_clients_path, :notice => "Fiche client supprimée"
    end
  
  end
end
