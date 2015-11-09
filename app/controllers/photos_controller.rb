class PhotosController < ApplicationController
	before_action :authenticate_usermodel!
	def create
		@stay = Stay.find(params[:stay_id])
		@stay.photos.create(photo_params)
		redirect_to stay_path(@stay)
	end

	private

	def photo_params
		params.require(:photo).permit(:caption, :picture, :usermodel_id)
	end
end
