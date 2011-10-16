class PagesController < ApplicationController
  include SessionsHelper


  def leaderboards

    respond_to do |format|
      format.html
    end
  end

  def users
    @TopUsers = ItemHistory.find(:all, :select => "user_id, count(id) as user_count", :group => "user_id", :order => "user_count DESC")

    respond_to do |format|
      format.html
    end
  end

  def items
    @TopItems = ItemHistory.find(:all, :select => "item_id, count(id) as item_count", :group => "item_id", :order => "item_count DESC")

    respond_to do |format|
      format.html
    end
  end


  def items2
    @TopItems2 = ItemHistory.find(:all, :select => "runningdistance, max{runningdistance} as item_distance", :group => "runningdistance", :order => "runningdistance DESC")

    respond_to do |format|
      format.html
    end
  end

end
