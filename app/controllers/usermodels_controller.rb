class UsermodelsController < ApplicationController

	def show 
		@user = Usermodel.find(params[:id])
	end
end
