class StaysController < ApplicationController
	before_action :authenticate_usermodel!, :only => [:new, :create, :edit, :update]

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

	def show
		@stay = Stay.find(params[:id])
	end

	def edit
		@stay = Stay.find(params[:id])

		if @stay.usermodel != current_usermodel
			return render :text => 'Not Allowed', :status => :forbidden
		end
	end

	def update
		@stay = Stay.find(params[:id])
		if @stay.usermodel != current_usermodel
			return render :text => 'Not Allowed', :status => :forbidden
		end
		@stay.update_attributes(stay_params)
		redirect_to root_path
	end

	def destroy
		@stay = Stay.find(params[:id])
		@stay.destroy
		redirect_to root_path
	end

	private

	def stay_params
		params.require(:stay).permit(:name, :description, :address)
	end
end
