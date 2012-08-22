class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :description
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :facture_id

      t.timestamps
    end
  end
end
