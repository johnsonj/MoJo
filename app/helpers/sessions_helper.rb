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
    admin_deny unless hasAccess(:app, params[:appKey]) or isAdmin?
  end

  def admin_deny
    if current_user
      redirect_to :home_page
    else
      deny_access
    end
  end

  def admin_or_app_login_required
    admin_deny unless (hasAccess(:app, params[:appKey]) or isAdmin?) and is_logged_in
  end

  def admin_or_interactions_required
    admin_deny unless hasAccess(:interactions, params[:appKey]) or isAdmin?
  end

  def admin_or_api_required
    admin_deny unless ((hasAccess(:app, params[:appKey]) or hasAccess(:interactions, params[:appKey])) or isAdmin?)
  end

  def current_user_unless_admin
    if current_user
      if  isAdmin?
        current_user
      else
        if (current_user == User.find_by_username(params[:username]) || current_user == User.getByApiKey(params[:apiKey]))
          current_user
        else
          redirect_to :home_page
        end
      end
    else
      deny_access
    end
  end

  def is_logged_in
    current_user
  end
  def deny_access
    store_location
    redirect_to :login_path, :notice => "Please sign in to access this page."
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  private

  def store_location
    session[:return_to] = request.fullpath
  end

  def clear_return_to
    session[:return_to] = nil
  end
end
