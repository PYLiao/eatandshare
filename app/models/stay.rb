class Stay < ActiveRecord::Base
	belongs_to :usermodel
	validates :name, :presence => true
end
