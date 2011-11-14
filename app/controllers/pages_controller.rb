class PagesController < ApplicationController
  include SessionsHelper

  before_filter :admin_login_required, :only => :admin
  before_filter :login_required, :only => [:leaderboards, :top_hops_by_user, :top_hops_by_item, :running_distance_by_item]

  def home
    if current_user
      if isAdmin?
        redirect_to :admin_portal_path
      else
        redirect_to :backpack_path
      end
    else
      redirect_to :login_path
    end
  end

  def admin
  end

  def leaderboards
  end

  def top_hops_by_user
    @top_users = ItemHistory.select("user_id, count(id) as user_count").group("user_id").order("user_count DESC").limit(10)
    @top_users.each do |usr|
      @usr = usr
    end
  end

  def top_hops_by_item
    @results = ItemHistory.select("item_id, count(id) as item_count").group("item_id").order("item_count DESC")
    @top_items = []
    @info = []
    @results.each do |result|
      item = Item.find(result.item_id)
      @info << {name => item.item_description.name}
    end
    @top_items = Item.find(@top_items)
  end


  def running_distance_by_item
    @top_items = ItemHistory.select("runningdistance, max(runningdistance) as item_distance").group("runningdistance").order("runningdistance DESC").limit(10)
  end

  def map_animation
  end

end
