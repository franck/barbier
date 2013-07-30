class Client < ActiveRecord::Base
  
  belongs_to :salon
  has_many :factures
  
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

  def self.has_is_birthday_this_week
    today = Date.today
    where("DATE_FORMAT(birthdate, '%m%d') >= ? and DATE_FORMAT(birthdate, '%m%d') <= ?", today.beginning_of_week.strftime('%m%d'), today.end_of_week.strftime('%m%d'))
  end
  
end
