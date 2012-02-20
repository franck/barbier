class Theme < ActiveRecord::Base
  belongs_to :salon
  validates :title, :presence => true
  
  scope :from_salon, lambda{|salon_id| where("salon_id = ?", salon_id) }

  def self.current(salon_id)
    Theme.from_salon(salon_id).where("state = 'active'").first
  end
  
  def self.desactivate_all_themes(salon_id)
    Theme.from_salon(salon_id).update_all(:state => nil,)
  end
    
  def activate
    Theme.from_salon(salon_id).where("state = ?", 'active').update_all(:state => nil,)
    self.reload
    self.state = 'active'
    self.save
  end  
  
end
