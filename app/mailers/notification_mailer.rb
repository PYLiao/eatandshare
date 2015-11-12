class NotificationMailer < ActionMailer::Base
  default from: "no-reply@eatandshareapp.com"

  def comment_added(comment)
  	@stay = comment.stay
  	@stay_owner = @stay.usermodel
  	mail(to: @stay_owner.email,
  		 subject: "A comment has been added to your #{@stay.name}")
  end
end
