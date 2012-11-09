class UserMailer < ActionMailer::Base
  default from: "joshbegin@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.confirm_active.subject
  #
  def confirm_active(user)
    @user = user
    @url = "http://localhost:3000/signin"

    mail to: user.email, subject: "Welcome to the Carrier Site"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.admin_confirmation.subject
  #
  def admin_confirmation(user)
    @user = user
    @url = "http://localhost:3000/users/#{@user.id}"
    
    mail to: "joshbegin@gmail.com", subject: "New user for Carrier Site - #{user.full_name}"
  end
end