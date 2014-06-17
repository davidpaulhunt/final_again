class SessionsController < ApplicationController

  skip_filter :ensure_logged_in, only: [:new, :create]
  
  before_filter :in_session, only: :new

  def create
    user = User.find_by_email(params[:email]).try(:authenticate, params[:password])

    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now.alert = "Invalid email or password."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "You have logged out."
  end

  def in_session
    redirect_to root_path if current_user
  end

end
