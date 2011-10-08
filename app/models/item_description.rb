# == Schema Information
#
# Table name: item_descriptions
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  rarity      :string(255)
#  image_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class ItemDescription < ActiveRecord::Base

  has_one :Image
  has_one :item

end
