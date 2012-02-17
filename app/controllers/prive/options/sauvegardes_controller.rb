# encoding: utf-8
require 'csv'

module Prive
  class Options::SauvegardesController < BaseController
    
    def index
    end
    
    def export
      @outfile = "clients_" + Time.now.strftime("%d-%m-%Y") + ".csv"
      @clients = Client.all
      
      csv_data = CSV.generate({:col_sep => ';'}) do |csv|
        csv << [
          "Nom",
          "Email",
          "Téléphone",
          "Note"
        ]
        @clients.each do |client|
          csv << [
            client.name,
            client.email,
            client.phone,
            client.comment
          ]
        end
      end
      
      send_data csv_data, :type => 'text/csv; charset=utf-8; header=present', :disposition => "attachment; filename=#{@outfile}"
    end
    
  end
end