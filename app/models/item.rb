# == Schema Information
#
# Table name: items
#
#  id                  :integer         primary key
#  user_id             :integer
#  latitude            :float
#  longitude           :float
#  created_at          :timestamp
#  updated_at          :timestamp
#  item_description_id :integer
#

class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :item_description, :foreign_key => "item_description_id"
  has_many :item_histories, :order => "stamp DESC", :limit => 30

  validates :item_description_id, :presence => true
  validates_numericality_of :latitude, :less_than => 90, :greater_than => -90
  validates_numericality_of :longitude, :less_than => 180, :greater_than => -180

  reverse_geocoded_by :latitude, :longitude
  
  validates_each :user_id do |model, attr, value|
    if (model.changed_attributes["user_id"] != nil)
      last_history = model.item_histories.last
     # hlist = ItemHistory.where(:item_id => model.id)
    #  last_history = hlist.last
      if (last_history != nil)
       if (last_history.user_id == value)
           model.errors.add(attr, "A user can not pick up this item until someone else has")
        end
      end
    end
  end

  def thumb
    item_description.thumb
  end

  def rarity
    item_description.rarity
  end

  def hops
    item_histories.count
  end

  def running
    item_histories.first.runningdistance
  end

  def last_message
    item_histories.first.formatted_message
  end

  def name
    item_description.name
  end

end


