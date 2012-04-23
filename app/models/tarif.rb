class Tarif < ActiveRecord::Base
  belongs_to :salon
  belongs_to :tarif_category
  
  validates :title, :presence => true
  validates :price, :presence => true, :numericality => { :allow_nil => true }
end
