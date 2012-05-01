class TarifCategory < ActiveRecord::Base
  has_many :tarifs, :dependent => :nullify

  def self.order!(ids)
    logger.debug("IDS : #{ids}")
    update_all(
      ['position = FIND_IN_SET(id, ?)', ids.join(',')],
      { :id => ids }
    )
  end

  private

  before_create :set_position

  def set_position
    self.position = TarifCategory.count + 1
  end

end
