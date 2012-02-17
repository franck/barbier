class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :salon_id
      t.string :picture_file_name
      t.integer :picture_file_size
      t.string :picture_content_type
      t.datetime :picture_updated_at

      t.timestamps
    end
  end
end
