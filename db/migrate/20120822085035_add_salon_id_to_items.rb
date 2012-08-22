class AddSalonIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :salon_id, :integer

  end
end
