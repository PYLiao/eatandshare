class NotificationMailer < ActionMailer::Base
  default from: "no-reply@eatandshareapp.com"

  def comment_added
  	mail(to: "lby75429@gmail.com",
  		 subject: "A comment has been added to your place")
  end
end
