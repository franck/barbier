class Message < ActiveRecord::Base
  belongs_to :salon
  validates :title, :presence => true
end
