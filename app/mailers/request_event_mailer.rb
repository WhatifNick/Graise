class RequestEventMailer < ApplicationMailer
  def send_notification(user)
    @user = user

    mail to: @user.email, subject: "Thanks for signing up"
  end
  def send_request(email, user)
    @email = email
    @user = user
    mail to: @email, subject: "You've got a request from #{@user.first_name}"
  end
end
