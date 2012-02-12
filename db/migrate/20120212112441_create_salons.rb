class CreateSalons < ActiveRecord::Migration
  def change
    create_table :salons do |t|
      t.string :name
      t.string :subdomain

      t.timestamps
    end
  end
end
