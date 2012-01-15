class AddDomainToSalons < ActiveRecord::Migration
  def change
    add_column :salons, :domain, :string

  end
end
