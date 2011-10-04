require 'digest/sha1'
require 'sessions_helper'

class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    respond_to do |format|
      format.html {
        usr = User.find_by_username(params[:session][:username])
        if usr && usr.authenticate(params[:session][:password])
          session[:user_id] = usr.id
          redirect_to :home_page, :notice => "Logged in!"
        else
          flash.now[:error] = "Invalid email or password"
          render "new"
        end
      }
      format.json {
        usr = User.find_by_username(params[:username])
        puts 'Could not find Username' if !usr
        if usr && usr.authenticate(params[:password]) && hasAccess(:app, params[:appKey])
          usr.api_key = Digest::SHA1.hexdigest(usr.email + usr.username + Time.now.to_s + Random.rand(1001).to_s)
          usr.save
          render :json => usr.api_key, :status => :ok
        else
          render :json => "Could not log in", :status => :unauthorized
        end
      }
    end
  end

  def destroy
    respond_to do |format|
     format.html {
       session[:user_id] = nil
       redirect_to :home_page, :notice => "Logged out!"
     }
     format.json {
       if current_user
         @current_user.api_key = ""
         @current_user.save
         render :json => "You have been logged out", :status => :ok
       else
         render :json => "Cannot find key", :status => :not_found
       end
     }
    end
  end

end
