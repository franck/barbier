class Tarif < ActiveRecord::Base
  belongs_to :salon
  belongs_to :tarif_category
  
  validates :title, :presence => true
  validates :price, :presence => true, :numericality => { :allow_nil => true }

  default_scope :order => "position ASC"

  def self.order!(ids)
    update_all(
      ["position = FIND_IN_SET(id, ?)", ids.join(',')],
      { :id => ids }
    )
  end

  private

  before_create :set_position

  def set_position
    logger.debug("TARIF CATEGORY ID: #{tarif_category_id}")
    if tarif_category_id.nil?
      self.position = Tarif.where(:tarif_category_id => nil).count + 1
    else
      self.position = Tarif.where(:tarif_category_id => self.tarif_category_id).count + 1
    end
  end
end
