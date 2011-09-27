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
  
  before_save :calculate_runningdistance

  def calculate_runningdistance
    previous = ItemHistory.where(:item_id => self.item_id).last
    if previous != nil
      runningdistance = 7
    else
      runningdistance = 0
    end
  end
end
