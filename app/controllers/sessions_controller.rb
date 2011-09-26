class SessionsController < ApplicationController

  def new
  end

  def create
    usr = User.find_by_username(params[:session][:username])
    if usr && usr.authenticate(params[:session][:password])
      session[:user_id] = usr.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now[:error] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
