class Salon < ActiveRecord::Base
  
  has_many :clients
  
  validates_presence_of :name
  validates_presence_of :subdomain
  validates_uniqueness_of :subdomain, :allow_blank => true
  
end
