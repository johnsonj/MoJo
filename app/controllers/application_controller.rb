class ApplicationController < ActionController::Base
  protect_from_forgery


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @current_user ||= User.getByApiKey(params[:apiKey])
  end

  helper_method :current_user
end
