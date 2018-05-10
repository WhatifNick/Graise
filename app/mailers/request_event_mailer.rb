class RequestEventMailer < ApplicationMailer
  def send_request(email)
    @email = email
    mail to: @email, subject: "You've got a request"
  end
end
