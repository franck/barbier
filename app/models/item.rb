class Item < ActiveRecord::Base
  attr_accessible :description, :price, :facture_id, :salon_id, :category
  belongs_to :facture

  validates :price, :presence => true, :numericality => true

  def self.services_in_factures(factures)
    self.where("facture_id IN (?)", factures.map(&:id)).group(:category).map(&:category)
  end
end

