class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.text :content
      t.integer :salon_id

      t.timestamps
    end
  end
end
