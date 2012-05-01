class AddPositionToTarifs < ActiveRecord::Migration
  def change
    add_column :tarifs, :position, :integer

  end
end
