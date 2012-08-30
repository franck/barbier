class CreateProduits < ActiveRecord::Migration
  def change
    create_table :produits do |t|
      t.string :name
      t.text :description
      t.integer :quantity
      t.integer :salon_id
      t.integer :produit_category_id
      t.decimal :price, :decimal, :precision => 8, :scale => 2
      t.string :picture_file_name
      t.integer :picture_file_size
      t.string :picture_content_type
      t.datetime :picture_updated_at

      t.timestamps
    end
  end
end
