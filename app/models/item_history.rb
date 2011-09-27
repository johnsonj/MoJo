# == Schema Information
#
# Table name: item_histories
#
#  id              :integer         not null, primary key
#  user_id         :integer
#  item_id         :integer
#  latitude        :float
#  longitude       :float
#  signature       :string(255)
#  stamp           :datetime
#  runningdistance :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class ItemHistory < ActiveRecord::Base
  belongs_to :Item
  has_one :User
 
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
end
