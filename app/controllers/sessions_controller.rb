class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password]) && user.verified
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    elsif user && user.authenticate(params[:password])
      redirect_to verify_url, notice: "You are not verified"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
