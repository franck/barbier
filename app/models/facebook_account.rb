class FacebookAccount < ActiveRecord::Base
  
  belongs_to :salon
  
  class << self
    def auth(redirect_uri = nil)
      FbGraph::Auth.new SalonVar::FACEBOOK_CLIENT_ID, SalonVar::FACEBOOK_CLIENT_SECRET, :redirect_uri => redirect_uri
    end

    def identify(fb_user, salon_id)
      user = where(:identifier => fb_user.identifier.try(:to_s)).where(:salon_id => salon_id).first
  
      if user.nil?
        user = self.new(:salon_id => salon_id, :identifier => fb_user.identifier) 
      end
      
      user.access_token = fb_user.access_token.access_token
      
      fb_user_fetched = FbGraph::User.new(fb_user.identifier).fetch
      
      user.name = fb_user_fetched.name
      user.picture = fb_user_fetched.picture
      user.save!
      user
    end
  end
  
  def update_page!(page, page_access_token)
    self.page_name = page.name
    self.page_access_token = page_access_token
    self.page_picture = page.picture
    self.page_identifier = page.identifier
    save!
  end
  
  def remove_page!
    self.page_name = nil
    self.page_access_token = nil
    self.page_picture = nil
    self.page_identifier = nil
    save!
  end
  
  
end
