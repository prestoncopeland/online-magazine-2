class Photo < ActiveRecord::Base
  belongs_to :article

  has_attached_file :photo, styles: { thumb: "64x64", med: "100x100", large: "200x200" }
  validates_attachment_content_type :photo, :content_type => ["photo/jpg", "photo/jpeg", "photo/png"]
end
