module SessionsHelper

  def log_user_in(usr)
    session[:user_id] = usr.id
  end

  def login_required
    deny_access unless is_logged_in
  end

  def admin_login_required
    deny_access unless is_logged_in && isAdmin?
  end

  def admin_or_app_required
    deny_access unless hasAccess(:app, params[:appKey]) or isAdmin?
  end

  def admin_or_app_login_required
    deny_access unless (hasAccess(:app, params[:appKey]) or isAdmin?) and is_logged_in
  end

  def admin_or_interactions_required
    deny_access unless hasAccess(:interactions, params[:appKey]) or isAdmin?
  end

  def admin_or_api_required
    deny_access unless ((hasAccess(:app, params[:appKey]) or hasAccess(:interactions, params[:appKey])) or isAdmin?)
  end

  def is_logged_in
    current_user
  end

  def deny_access
    redirect_to :login_path, :notice => "Please sign in to access this page."
  end
end
