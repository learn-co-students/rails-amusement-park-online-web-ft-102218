class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login, except: [:new, :create, :index]
  helper_method :current_user, :logged_in?

  def logged_in?
    !!current_user
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_login
    redirect_to root_path unless logged_in?
  end
end
