class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  # Kollar nuvarande user och jämför med DB.
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Returnerar true om den hittar en nuvarande user
  def logged_in?
    !!current_user 
  end

  # Om den inte hittar en nuvarande user dvs. false
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end

end
