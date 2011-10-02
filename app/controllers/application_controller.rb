class ApplicationController < ActionController::Base
  protect_from_forgery


  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @current_user ||= User.getByApiKey(params[:apiKey])
  end

  def isAdmin?
    current_user if current_user.type == :admin
  end

  def hasAccess(sym, key)
    usr = User.getByApiKey(key)
    usr if usr.user_type == sym
  end

  helper_method :current_user
end
