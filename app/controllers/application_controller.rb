class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :ensure_logged_in
  helper_method :current_user

  def ensure_logged_in
    if current_user.nil?
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= Account.find(session[:account_id]) if session[:account_id]
  end

end
