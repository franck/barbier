class Message < ActiveRecord::Base
  include ApplicationHelper
  belongs_to :salon
  validates :title, :presence => true
  
  scope :published, where("published_at IS NOT NULL")
  
  def send_to_facebook
    fb_account = self.salon.facebook_account
    return unless fb_account
    
    if publish_on_facebook_account && published_on_facebook_account_at.nil?
      send_to_facebook_account!(fb_account)
    end
    
    if publish_on_facebook_page && published_on_facebook_page_at.nil?
      send_to_facebook_page!(fb_account)
    end
  end
  
  def send_to_facebook_account!(fb_account)
    me = FbGraph::User.me(fb_account.access_token)
    result = me.feed!(:message => facebook_message) if title.present? or content.present?
    logger.debug("ACCOUNT RESULT : #{result.inspect}")
    self.published_on_facebook_account_at = Time.now
    save!
  end
  
  def send_to_facebook_page!(fb_account)
    return unless fb_account.page_identifier
    page = FbGraph::Page.new(fb_account.page_identifier, :access_token => fb_account.page_access_token)
    result = page.feed!(:message => facebook_message) if title.present? or content.present?
    logger.debug("PAGE RESULT : #{result.inspect}")
    self.published_on_facebook_page_at = Time.now
    save!
  end
  
  def published?
    return true if !published_at.nil?
  end
  
  def publish!
    self.published_at = Time.now
    save!
  end
  
  def unpublish!
    self.published_at = nil
    save!
  end
  
  private
  
  def facebook_message
    message = self.title + ("\n\n").html_safe + self.content
  end
  
end
