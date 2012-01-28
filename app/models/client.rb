class Client < ActiveRecord::Base
  
  validates_presence_of :name
  validates_format_of   :email, :with  => /\A[^@]+@[^@]+\z/, :allow_blank => true
  
end
