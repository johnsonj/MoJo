# == Schema Information
#
# Table name: items
#
#  id             :integer         not null, primary key
#  user_id        :integer
#  latitude       :float
#  longitude      :float
#  created_at     :datetime
#  updated_at     :datetime
#  description_id :integer
#

require 'spec_helper'

describe Item do
  pending "add some examples to (or delete) #{__FILE__}"
end
