class Review < ActiveRecord::Base
  mount_uploader :image, ReviewImageUploader
end
