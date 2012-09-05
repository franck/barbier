class CategoryFacture < ActiveRecord::Base
  belongs_to :salon
  default_scope order(:name)
end
