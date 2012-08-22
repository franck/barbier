class Item < ActiveRecord::Base
  attr_accessible :description, :price, :facture_id, :salon_id
  belongs_to :facture

  validates :price, :presence => true, :numericality => true
end

