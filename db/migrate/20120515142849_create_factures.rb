class CreateFactures < ActiveRecord::Migration
  def change
    create_table :factures do |t|
      t.integer :client_id
      t.date :payed_at

      t.timestamps
    end
  end
end
