class AddHorairesToSalons < ActiveRecord::Migration
  def change
    add_column :salons, :horaires, :text

  end
end
