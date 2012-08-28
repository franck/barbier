class AddPriceToProduits < ActiveRecord::Migration
  def change
    add_column :produits, :price, :decimal, :precision => 8, :scale => 2
  end
end
