class Facture < ActiveRecord::Base
  MEANS_OF_PAYMENT = ["cash", "card", "check", "other" ]

  attr_accessible :payed_at, :items_attributes, :mean_of_payment
  belongs_to :client
  has_many :items, :dependent => :destroy
  accepts_nested_attributes_for :items, allow_destroy: true#, :reject_if => :reject_items

  validates_presence_of :payed_at
  validates_presence_of :mean_of_payment
  validates_associated :items
  validates :items, :length => { :minimum => 1 }

  def reject_items(attributed)
    price = attributed['price']
    return true if price.blank?

    price.gsub!(/,/, '.')
    return true unless parse_raw_value_as_a_number(price).is_a?(Numeric)

    false
  end

  protected

  def parse_raw_value_as_a_number(raw_value)
    case raw_value
    when /\A0[xX]/
      nil
    else
      begin
        Kernel.Float(raw_value)
      rescue ArgumentError, TypeError
        nil
      end
    end
  end

end
