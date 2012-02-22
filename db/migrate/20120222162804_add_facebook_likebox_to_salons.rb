class AddFacebookLikeboxToSalons < ActiveRecord::Migration
  def change
    add_column :salons, :facebook_likebox, :boolean

  end
end
