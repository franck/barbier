require 'subdomain_validator'
require 'password'

class Salon < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
  attr_accessible :password_confirmation, :password, :name, :subdomain, 
    :title, :description, :horaires, :public_email, :phone, :address, :postalcode, :city, :carte, :domain
  
  has_many :clients, :dependent => :destroy
  has_many :produits, :dependent => :destroy
  has_many :photos, :dependent => :destroy
  has_many :messages, :dependent => :destroy
  has_many :tarifs, :dependent => :destroy
  has_many :tarif_categories, :dependent => :destroy
  has_many :themes, :dependent => :destroy
  has_one :facebook_account, :dependent => :destroy
  has_many :produits, :dependent => :destroy
  has_many :produit_categories, :dependent => :destroy
  has_many :factures, :dependent => :destroy
  
  before_save :update_password
  
  validates :name, :presence => true
  validates :subdomain, :presence => true,
                        :uniqueness => { :allow_blank => true},
                        :subdomain => true
                        
  validates_presence_of     :password, :if => :password_required?
  validates_confirmation_of :password, :if => :password_required?
  validates_length_of       :password, :within => 3..128, :allow_blank => true
  
  validates_format_of   :public_email, :with  => /\A[^@]+@[^@]+\z/, :allow_blank => true
                        
  def authenticate(text)
    if Password::match?(self.encrypted_password, text)
      true
    else
      false
    end
  end

  def unique_items
    Item.where("salon_id", self.id).select(:description).uniq.map{|i| i.description }
    #items = ["Coiffure", "Mousse a raser", "test"]
  end
  
  protected
  
  def update_password
    self.encrypted_password = Password::encrypt(self.password) if password_required?
  end
  
  def password_required?
    new_record? || password.present? || password_confirmation.present?
  end
  
end
