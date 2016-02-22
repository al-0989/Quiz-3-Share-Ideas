class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user_signed_in?
    session[:user_id].present?
  end
  helper_method :user_signed_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if user_signed_in?
  end
  helper_method :current_user

  # It is not necessary to make it a helper method since the views have no need
  # to access this method
  def sign_in(user)
    session[:user_id] = user.id
  end

  def authenticate_user
    # if session[:user_id] is nil we redirect to the sign in page
    redirect_to new_session_path, notice: "Please Sign in." unless user_signed_in?
  end
end
