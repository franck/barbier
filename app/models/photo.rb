class Photo < ActiveRecord::Base
  belongs_to :salon
  has_attached_file :picture, :styles => { :large => "500", :medium => "400", :thumb => "200" },
    :convert_options => { :thumb => "-background white -gravity Center -crop '200x150+0+0'" }
    
  validates_attachment_presence :picture
  validates_attachment_size :picture, :less_than => 5.megabytes, :message => "La photo est trop lourde (max 5Mo)"
  validates_attachment_content_type :picture, :content_type => ['image/jpeg'], :message => "La format du fichier est incorrect (JPG ou JPEG seulement)"
end
