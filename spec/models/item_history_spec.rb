# == Schema Information
#
# Table name: item_histories
#
#  id              :integer         primary key
#  user_id         :integer
#  item_id         :integer
#  latitude        :float
#  longitude       :float
#  signature       :string(255)
#  stamp           :timestamp
#  created_at      :timestamp
#  updated_at      :timestamp
#  runningdistance :float
#

require 'spec_helper'

describe ItemHistory do
  pending "add some examples to (or delete) #{__FILE__}"
end
