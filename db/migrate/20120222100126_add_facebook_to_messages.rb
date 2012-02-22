class AddFacebookToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :publish_on_facebook_account, :boolean
    add_column :messages, :published_on_facebook_account_at, :datetime
    add_column :messages, :publish_on_facebook_page, :boolean
    add_column :messages, :published_on_facebook_page_at, :datetime

  end
end
