class Photo < ActiveRecord::Base
	belongs_to :usermodel
	belongs_to :stay
end
