class TarifCategory < ActiveRecord::Base
  has_many :tarifs, :dependent => :nullify

end
