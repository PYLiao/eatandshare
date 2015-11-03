class StaysController < ApplicationController
	def index
		@stays = Stay.order("name").page(params[:page]).per(4)
	end

	def new
		@stay = Stay.new
	end
end
