# == Schema Information
#
# Table name: items
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  name        :string(255)
#  description :text
#  latitude    :float
#  longitude   :float
#  image_id    :integer
#  rarity      :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Item < ActiveRecord::Base
  has_one :Image
  belongs_to :User
  has_many :ItemHistory, :order => "stamp DESC", :limit => 30

  save_copy = nil

  after_find :save_copy_if_needed
  after_save :create_if_needed

  # This is an owned item, it might get dropped
  def save_copy_if_needed
    if self.user_id != User.WORLD_USER_ID
      save_copy = self.clone()
    end
  end

  # If this item was owned and it changed hands, eg was dropped
  def create_if_needed
    if save_copy != nil && self.user_id == User.WORLD_USER_ID
      history = ItemHistory.new()
      history.user = save_copy.user
      history.item = save_copy
      history.latitude = self.latitude
      history.longitude = self.longitude
      history.save()
    end
  end
end
