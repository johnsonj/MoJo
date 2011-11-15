# == Schema Information
#
# Table name: item_histories
#
#  id              :integer         primary key
#  user_id         :integer
#  item_id         :integer
#  latitude        :float
#  longitude       :float
#  signature       :string(255)
#  stamp           :timestamp
#  created_at      :timestamp
#  updated_at      :timestamp
#  runningdistance :float
#

class ItemHistory < ActiveRecord::Base
  belongs_to :Item
  belongs_to :user

  before_create :init
  before_save :calculate_runningdistance
  reverse_geocoded_by :latitude, :longitude

  def init
    self.stamp = DateTime.current
  end

  def calculate_runningdistance
    previous = ItemHistory.where(:item_id => self.item_id).last
    if previous && previous.runningdistance
      dist = (self.distance_from(previous))
      self.runningdistance = dist + previous.runningdistance
    else
      self.runningdistance = 0
    end
  end

  def formatted_message
    "#{signature} \n -#{user.username}"
  end
end
