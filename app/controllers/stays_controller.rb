class StaysController < ApplicationController
	def index
		@stays = Stay.order(created_at: :desc).page(params[:page]).per(4)
	end

	def new
		@stay = Stay.new
	end

	def create
		Stay.create(stay_params)
		redirect_to root_path
	end

	private

	def stay_params
		params.require(:stay).permit(:name, :description, :address)
	end
end
