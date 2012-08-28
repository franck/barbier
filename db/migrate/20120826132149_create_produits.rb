class CreateProduits < ActiveRecord::Migration
  def change
    create_table :produits do |t|
      t.string :name
      t.text :description
      t.integer :quantity
      t.integer :salon_id
      t.integer :produit_category_id

      t.timestamps
    end
  end
end
