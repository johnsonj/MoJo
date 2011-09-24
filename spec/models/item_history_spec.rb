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

require 'spec_helper'

describe ItemHistory do
  pending "add some examples to (or delete) #{__FILE__}"
end
