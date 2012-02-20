class Tarif < ActiveRecord::Base
  belongs_to :salon
  
  validates :title, :presence => true
  validates :price, :presence => true, :numericality => { :allow_nil => true }
end
