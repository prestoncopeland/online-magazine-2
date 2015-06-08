class Photo < ActiveRecord::Base
  belongs_to :article

  has_attached_file :photo, :styles => { :thumb => "220X119>", :med => "270x321>", :large => "590x273>" }
  validates_attachment_content_type :photo,
  :content_type => /\Aimage\/.*\Z/
   validates_attachment_file_name :photo, :matches => [/png\Z/, /jpe?g\Z/]
end
