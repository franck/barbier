class CreateFacebookAccounts < ActiveRecord::Migration
  def change
    create_table :facebook_accounts do |t|
      t.string :identifier
      t.string :name
      t.string :picture
      t.string :access_token
      t.string :page_access_token
      t.string :page_name
      t.string :page_identifier
      t.string :page_picture
      t.integer :salon_id

      t.timestamps
    end
  end
end
