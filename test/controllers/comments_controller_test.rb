require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "create comment" do
  	user = FactoryGirl.create(:usermodel)
  	sign_in user
  	stay = FactoryGirl.create(:stay)
  	assert_difference 'stay.comments.count' do
  		post :create, :stay_id => stay.id, :comment => {
  		:message => 'Awesome', :rating => '5_stars'
  		}
  	end
  	assert_redirected_to stay_path(stay)
  end
end
