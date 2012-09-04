class CreateCategoryFactures < ActiveRecord::Migration
  def change
    create_table :category_factures do |t|
      t.string :name
      t.integer :salon_id

      t.timestamps
    end
  end
end
