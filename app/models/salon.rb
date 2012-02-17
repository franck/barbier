require 'subdomain_validator'
require 'password'

class Salon < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
  
  has_many :clients
  
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
  
  protected
  
  def update_password
    self.encrypted_password = Password::encrypt(self.password) if password_required?
  end
  
  def password_required?
    new_record? || password.present? || password_confirmation.present?
  end
  
end
