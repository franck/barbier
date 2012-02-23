class AddCarteToSalons < ActiveRecord::Migration
  def change
    add_column :salons, :carte, :boolean

    add_column :salons, :lat, :string

    add_column :salons, :long, :string

  end
end
