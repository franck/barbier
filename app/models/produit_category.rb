class ProduitCategory < ActiveRecord::Base
  has_many :produits, :dependent => :nullify

  validates :name, :presence => true
end
