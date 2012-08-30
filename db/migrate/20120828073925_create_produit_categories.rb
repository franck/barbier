class CreateProduitCategories < ActiveRecord::Migration
  def change
    create_table :produit_categories do |t|
      t.string :name
      t.integer :salon_id

      t.timestamps
    end
  end
end
