class PagesController < ApplicationController
  include SessionsHelper

  before_filter :admin_login_required, :only => :admin
  before_filter :login_required, :only => [:top_drops_by_user, :top_hops_by_item, :running_distance_by_item]

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

  def about
  end

  def top_drops_by_user
    @title = "Users With The Most Drops"
    users = ItemHistory.select("user_id, count(id) as user_count").group("user_id").order("user_count DESC").limit(10)
    @top_users = []
    users.each do |usr|
      user = User.find(usr.user_id)
      last_message = user.item_histories.last
      @top_users << {:username => user.username, :drops => usr.user_count, :last_message => last_message.signature}
    end
  end

  def build_hops_table_for(results)
    output = []
    results.each do |result|
      item = Item.find(result.item_id)
      item_desc = item.item_description
      last_drop = item.item_histories.last
      output << {:image => item_desc.thumb, :name => item_desc.name,
                 :hops => result.item_count, :last_message => last_drop.formatted_message,
                 :rarity => item_desc.rarity, :drop_date => last_drop.stamp.strftime("%Y/%m/%d %H:%M"),
                 :distance => item.running}
    end
    output
  end

  def top_hops_by_item
    @title = "Items With The Most Hops"
    @results = ItemHistory.select("item_id, count(id) as item_count").group("item_id").order("item_count DESC").limit(10)
    @world = build_hops_table_for @results

    @results = ItemHistory.select("item_id, count(id) as item_count").where(:user_id => current_user.id).group("item_id").order("item_count DESC").limit(10)
    @mine = build_hops_table_for @results
  end


  def running_distance_by_item
    @title = "Farthest Traveled Item"
    results = ItemHistory.select("item_id, sum(runningdistance) as item_distance").group("item_id").order("item_distance DESC").limit(10)
    @top_items = build_distance_table_for results
  end


  def build_distance_table_for(results)
    output = []
    results.each do |result|
      item = Item.find(result.item_id)
      item_desc = item.item_description
      last_drop = item.item_histories.last
      output << {:image => item_desc.thumb, :name => item_desc.name,
                 :last_message => last_drop.formatted_message, :distance => result.item_distance.to_f.round(2),
                 :rarity => item_desc.rarity, :drop_date => last_drop.stamp.strftime("%Y/%m/%d %H:%M"),
                 :hops => item.hops}
    end
    output
  end

  def map_animation
  end

  def canvas_map
  end
  
  def density_map
  end
end
