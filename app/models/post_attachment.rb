class PostAttachment < ApplicationRecord
    mount_uploader :gallerie, GallerieUploader
   belongs_to :camping
end
