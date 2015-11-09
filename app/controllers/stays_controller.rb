class StaysController < ApplicationController
	before_action :authenticate_usermodel!, :only => [:new, :create, :edit, :update, :destroy]

	def index
		@stays = Stay.order(created_at: :desc).page(params[:page]).per(4)
	end

	def new
		@stay = Stay.new
	end

	def create
		@stay = current_usermodel.stays.create(stay_params)
		if @stay.valid?
		redirect_to root_path
		else
		render :new, :status => :unprocessable_entity
		end
	end

	def show
		@stay = Stay.find(params[:id])
		@comment = Comment.new
		@photo = Photo.new
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
		if @stay.valid?
			redirect_to root_path
		else
			render :edit, :status => :unprocessable_entity
		end
	end

	def destroy
		@stay = Stay.find(params[:id])
		if @stay.usermodel != current_usermodel
			return render :text => 'Not Allowed', :status => forbidden
		end
		@stay.destroy
		redirect_to root_path
	end

	private

	def stay_params
		params.require(:stay).permit(:name, :description, :address)
	end
end
