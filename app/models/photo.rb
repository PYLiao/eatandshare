class Photo < ActiveRecord::Base
	mount_uploader :picture, PictureUploader
	belongs_to :usermodel
	belongs_to :stay
end
