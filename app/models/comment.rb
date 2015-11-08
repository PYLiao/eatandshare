class Comment < ActiveRecord::Base
	belongs_to :usermodel
	belongs_to :stay
end
