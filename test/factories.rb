FactoryGirl.define do 


	factory :comment do
		message "Welcome"
		rating "5_stars"
		association :usermodel
		association :stay
	end

	factory :usermodel do
		sequence :email do |n|
			"test#{n}@gmail.com"
		end
		password "lalalala"
		password_confirmation "lalalala"
	end

	factory :stay do
		name "Home"
		description "Some where I belong"
		address "Taichung City"
		latitude (24.1433333)
		longitude (120.6813889)
		association :usermodel
	end


end