class ApplicationController < ActionController::Base
  protect_from_forgery


  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if params[:apiKey]
      @current_user ||= User.getByApiKey(params[:apiKey])
    end
    @current_user
  end

  def isAdmin?
    current_user && current_user.user_type == :admin
  end

  def hasAccess(sym, key)
    usr = User.getByApiKey(key)
    if usr && usr.user_type == sym && key
      usr
    else
      puts "Key : #{(key if key)} does not have access to #{sym.to_s}"
    end
  end

  def app_required
    deny_access unless hasAccess(:app, params[:appKey])
  end

  helper_method :current_user, :isAdmin?, :hasAccess
end
