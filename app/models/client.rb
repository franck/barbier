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

  def self.has_is_birthday_this_week_grouped_by_date_and_sorted
    today = Date.today
    beginning_of_week = today.beginning_of_week
    end_of_week = today.end_of_week
    results = where("DATE_FORMAT(birthdate, '%m%d') >= ? and DATE_FORMAT(birthdate, '%m%d') <= ?", beginning_of_week.strftime('%m%d'), end_of_week.strftime('%m%d'))
    results_grouped = results.group_by{|client| client.birthdate.strftime("%d/%m") }
    results_grouped.sort_by do |date, clients|
      [clients.first.birthdate.month, clients.first.birthdate.day] 
    end
  end
  
end
