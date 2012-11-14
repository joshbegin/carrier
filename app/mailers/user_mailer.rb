class UserMailer < ActionMailer::Base
  default from: "joshbegin@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.confirm_active.subject
  #
  # email to user notifying them that they have been activated
  def confirm_active(user)
    @user = user
    @url = "http://carriers.herokuapp.com/users/signin"

    mail to: user.email, subject: "Welcome to the Carrier Site"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.admin_confirmation.subject
  # 
  # email to admin notifying them of a new user signing up
  def admin_confirmation(user)
    @user = user
    @url = "http://carriers.herokuapp.com/users/#{@user.id}"
    
    mail to: User.admins.pluck(:email), subject: "New user for Carrier Site - #{user.full_name}"
  end
  
  def password_reset(user)
      @user = user
      mail :to => user.email, :subject => "Password Reset"
    end
end