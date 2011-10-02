module SessionsHelper

  def login_required
    deny_access unless isLoggedIn?
  end

  def isLoggedIn?
    !session[:user_id].nil?
  end

  def deny_access
    redirect_to :login_path, :notice => "Please sign in to access this page."
  end
end
