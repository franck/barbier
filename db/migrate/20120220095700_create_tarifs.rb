class CreateTarifs < ActiveRecord::Migration
  def change
    create_table :tarifs do |t|
      t.string :title
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :salon_id
      t.timestamps
    end
  end
end
