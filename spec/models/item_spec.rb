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

require 'spec_helper'

describe Item do
  pending "add some examples to (or delete) #{__FILE__}"
end
