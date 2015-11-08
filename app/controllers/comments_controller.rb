class CommentsController < ApplicationController
	before_action :authenticate_usermodel!
	def create
		@stay = Stay.find(params[:stay_id])
		@stay.comments.create(comment_params.merge(:usermodel => current_usermodel))
		redirect_to stay_path(@stay)
	end

	private

	def comment_params
		params.require(:comment).permit(:message, :rating)
	end
end

