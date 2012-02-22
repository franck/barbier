class AddPageLinkToFacebookAccount < ActiveRecord::Migration
  def change
    add_column :facebook_accounts, :page_link, :string
  end
end
