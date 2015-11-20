require 'test_helper'

class UsermodelsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

    test "show userdashboard" do
  		user = FactoryGirl.create(:usermodel)
  		sign_in user
  		get :show, :id => user.id
  		assert_response :success
  	end

 
end
