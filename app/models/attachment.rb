class Attachment < ActiveRecord::Base
  belongs_to :photo
  belongs_to :article
end
