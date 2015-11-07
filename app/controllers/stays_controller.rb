class StaysController < ApplicationController
	before_action :authenticate_usermodel!, :only => [:new, :create]

	def index
		@stays = Stay.order(created_at: :desc).page(params[:page]).per(4)
	end

	def new
		@stay = Stay.new
	end

	def create
		current_usermodel.stays.create(stay_params)
		redirect_to root_path
	end

	private

	def stay_params
		params.require(:stay).permit(:name, :description, :address)
	end
end
