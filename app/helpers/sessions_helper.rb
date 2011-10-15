module SessionsHelper

  def log_user_in(usr)
    session[:user_id] = usr.id
  end

  def login_required
    deny_access unless isLoggedIn?
  end

  def admin_login_required
    deny_access unless isLoggedIn? && isAdmin?
  end

  def isLoggedIn?
    current_user
  end

  def deny_access
    redirect_to :login_path, :notice => "Please sign in to access this page."
  end
end
