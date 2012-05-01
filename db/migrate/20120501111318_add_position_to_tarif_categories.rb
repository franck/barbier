class AddPositionToTarifCategories < ActiveRecord::Migration
  def change
    add_column :tarif_categories, :position, :integer

  end
end
