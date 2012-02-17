class AddPasswordToSalons < ActiveRecord::Migration
  def change
    add_column :salons, :password, :string
  end
end
