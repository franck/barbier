class Client < ActiveRecord::Base
  
  belongs_to :salon
  
  validates :name, :presence => true
  validates :email, :format => { :with  => /\A[^@]+@[^@]+\z/, :allow_blank => true }
  validates :salon_id, :presence => true
  
  def self.search(search)  
    if search  
      scope = where('name like ? or email like ? or phone like ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end
  
end
