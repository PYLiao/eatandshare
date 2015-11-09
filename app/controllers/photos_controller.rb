class PhotosController < ApplicationController
	before_action :authenticate_usermodel!
	def create
		@stay = Stay.find(params[:stay.id])
		@stay.photos.create(photo_params.merge(:usermodel => current_usermodel))
		redirect_to stay_path(@stay)
	end

	private

	def photo_params
		params.require(:photo).permit(:caption)
	end
end
