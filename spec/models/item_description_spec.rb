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

require 'spec_helper'

describe ItemDescription do
  pending "add some examples to (or delete) #{__FILE__}"
end
