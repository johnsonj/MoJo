module SessionsHelper

  def login_required
    deny_access unless isLoggedIn?
  end

  def isLoggedIn?
    current_user != nil
  end

  def deny_access
    redirect_to :login_path, :notice => "Please sign in to access this page."
  end
end
