class AddInformationsToSalons < ActiveRecord::Migration
  def change
    add_column :salons, :public_email, :string

    add_column :salons, :phone, :string

    add_column :salons, :address, :string

    add_column :salons, :postalcode, :string

    add_column :salons, :city, :string

  end
end
