class AddTitleAndDescriptionToSalons < ActiveRecord::Migration
  def change
    add_column :salons, :title, :string

    add_column :salons, :description, :text

  end
end
