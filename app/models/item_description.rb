# == Schema Information
#
# Table name: item_descriptions
#
#  id          :integer         primary key
#  name        :string(255)
#  description :text
#  rarity      :string(255)
#  image_id    :integer
#  created_at  :timestamp
#  updated_at  :timestamp
#

class ItemDescription < ActiveRecord::Base

  belongs_to :image
  has_many :items, :dependent => :destroy

validates :name, :uniqueness => true
validates :description, :presence => true
validates :rarity, :presence => true
validates :image_id, :presence => true

  def thumb
    image.icon.url(:thumb)
  end

end
