class Client < ActiveRecord::Base
  
  validates_presence_of :name
  validates_format_of   :email, :with  => /\A[^@]+@[^@]+\z/, :allow_blank => true
  
  def self.search(search)  
    if search  
      scope = where('name like ? or email like ?', "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end
  
end
