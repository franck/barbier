class Photo < ActiveRecord::Base
  belongs_to :salon
  has_attached_file :picture, :styles => { :large => "500", :medium => "400", :thumb => "200" },
    :convert_options => { :thumb => "-background white -compose Copy -gravity center -extent 200x200" }
end
