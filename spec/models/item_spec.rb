# == Schema Information
#
# Table name: items
#
#  id          :integer         primary key
#  user_id     :integer
#  name        :string(255)
#  description :text
#  latitude    :float
#  longitude   :float
#  image_id    :integer
#  rarity      :integer
#  created_at  :timestamp
#  updated_at  :timestamp
#

require 'spec_helper'

describe Item do
  pending "add some examples to (or delete) #{__FILE__}"
end
