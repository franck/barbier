class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.text :html
      t.text :css
      t.string :title
      t.string :state
      t.integer :salon_id
      t.timestamps
    end
  end
end
