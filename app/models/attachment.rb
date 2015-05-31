class Attachment < ActiveRecord::Base
  belongs_to :photo
  belongs_to :article

  validates_presence_of :article
  validates_presence_of :photo

end
