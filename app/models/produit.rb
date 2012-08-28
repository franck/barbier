class Produit < ActiveRecord::Base
  belongs_to :salon
  belongs_to :produit_category
end
