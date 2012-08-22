# encoding: utf-8
module Prive
  class FacturesController < BaseController

    before_filter :get_client

    def new
      @facture = @client.factures.build(:payed_at => Date.today)
      @facture.items.build
    end

    def create
      params[:facture]["items_attributes"].each{|key, value| params[:facture]['items_attributes'][key]['salon_id'] = @salon.id }
      logger.debug("PARAMS FACTURE : #{params[:facture]}")

      @facture = @client.factures.build(params[:facture])
      if @facture.save
        redirect_to prive_client_path(@client), :notice => "Facture créée"
      else
        render :new
      end
    end

    def edit
      @facture = @client.factures.find(params[:id])
    end

    def update
      params[:facture]["items_attributes"].each{|key, value| params[:facture]['items_attributes'][key]['salon_id'] = @salon.id }
      logger.debug("PARAMS FACTURE : #{params[:facture]}")

      @facture = @client.factures.find(params[:id])
      if @facture.update_attributes(params[:facture])
        redirect_to prive_client_path(@client), :notice => "Facture modifiée"
      else
        render :edit
      end
    end

    def destroy
      @facture = @client.factures.find(params[:id])
      @facture.destroy
      redirect_to prive_client_path(@client), :notice => "Facture supprimée"
    end

    protected

    def get_client
      @client = @salon.clients.find(params[:client_id])
    end

  end
end
