class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) && user.try(:active)
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination or account is not active'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end