class ProduitCategory < ActiveRecord::Base
  has_many :produits, :dependent => :nullify
end
