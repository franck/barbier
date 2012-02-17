require 'subdomain_validator'
class Salon < ActiveRecord::Base
  
  has_many :clients
  
  validates :name, :presence => true
  validates :subdomain, :presence => true,
                        :uniqueness => { :allow_blank => true},
                        :subdomain => true
  
end
