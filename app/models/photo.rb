class Photo < ActiveRecord::Base
  belongs_to :article

  has_attached_file :photo, styles: { thumb: "100X100", med: "300x300", large: "500x500" }
  validates_attachment_content_type :photo,
  :content_type => /\Aimage\/.*\Z/
   validates_attachment_file_name :photo, :matches => [/png\Z/, /jpe?g\Z/]
end
