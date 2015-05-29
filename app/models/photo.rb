class Photo < ActiveRecord::Base
  has_many :attachments
  has_many :articles, through: :attachments

  has_attached_file :photo
  validates_attachment_content_type :photo, :content_type => ["photo/jpg", "photo/jpeg", "photo/png"]

end
