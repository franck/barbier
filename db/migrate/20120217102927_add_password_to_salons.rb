class AddPasswordToSalons < ActiveRecord::Migration
  def change
    add_column :salons, :encrypted_password, :string
  end
end
