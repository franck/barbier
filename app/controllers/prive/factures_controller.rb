# encoding: utf-8
module Prive
  class FacturesController < BaseController

    layout "factures"

    before_filter :get_client

    def index
      @date = params[:date] ? Date.parse(params[:date]) : Date.today
      @period = params[:period] ? params[:period] : 'day'
      
      @factures = Facture.find_by_date_and_period(@date, @period, @salon)
      @services = Item.services_in_factures(@factures)
      @items = Item.where("facture_id IN (?)", @factures.map(&:id)).group_by(&:category)
      respond_to do |format|
        format.html
        format.xls
      end
    end

    def new
      session[:return_to] = request.referer
      @facture = @salon.factures.build(:payed_at => Date.today)
      @facture.items.build
    end

    def create
      params[:facture]["salon_id"] = @salon.id
      params[:facture]["client_id"] = @client.id if @client
      params[:facture]["items_attributes"].each{|key, value| params[:facture]['items_attributes'][key]['salon_id'] = @salon.id }

      @facture = Facture.new(params[:facture])
      if @facture.save
        redirect_to session[:return_to], :notice => "Facture créée"
      else
        render :new
      end
    end

    def edit
      session[:return_to] = request.referer
      @facture = @salon.factures.find(params[:id])
    end

    def update
      params[:facture]["salon_id"] = @salon.id
      params[:facture]["client_id"] = @client.id if @client
      params[:facture]["items_attributes"].each{|key, value| params[:facture]['items_attributes'][key]['salon_id'] = @salon.id }

      @facture = @salon.factures.find(params[:id])
      if @facture.update_attributes(params[:facture])
        #if @client
        #  redirect_to prive_client_path(@client), :notice => "Facture modifiée"
        #else
        #  redirect_to prive_factures_path, :notice => "Facture modifiée"
        #end
        redirect_to session[:return_to], :notice => "Facture modifiée"
      else
        render :edit
      end
    end

    def destroy
      @facture = @salon.factures.find(params[:id])
      @facture.destroy
      if @client
        redirect_to prive_client_path(@client), :notice => "Facture supprimée"
      else
        redirect_to prive_factures_path, :notice => "Facture supprimée"
      end
    end

    protected

    def get_client
      if params[:client_id]
        @client = @salon.clients.find(params[:client_id])
      end
    end

  end
end
