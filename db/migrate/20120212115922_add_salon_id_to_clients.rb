class AddSalonIdToClients < ActiveRecord::Migration
  def change
    add_column :clients, :salon_id, :integer

  end
end
