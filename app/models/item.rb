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
end
