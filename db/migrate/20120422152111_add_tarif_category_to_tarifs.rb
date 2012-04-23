class AddTarifCategoryToTarifs < ActiveRecord::Migration
  def change
    add_column :tarifs, :tarif_category_id, :integer

  end
end
