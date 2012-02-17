require 'subdomain_validator'
require 'password'

class Salon < ActiveRecord::Base
  attr_accessor :password_confirmation
  
  has_many :clients
  
  before_save :update_password
  
  validates :name, :presence => true
  validates :subdomain, :presence => true,
                        :uniqueness => { :allow_blank => true},
                        :subdomain => true
                        
  validates_presence_of     :password, :if => :password_required?
  validates_confirmation_of :password, :if => :password_required?
  validates_length_of       :password, :within => 3..128, :allow_blank => true
                        
                        

  def authenticate(text)
    if Password::match?(self.password, text)
      true
    else
      false
    end
  end
  
  protected
  
  def update_password
    self.password = Password::encrypt(self.password) if password_required?
  end
  
  def password_required?
    new_record? || password.present? || password_confirmation.present?
  end
  
end
