# == Schema Information
#
# Table name: bagtypes
#
#  id         :integer         not null, primary key
#  size       :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Bagtype < ActiveRecord::Base
end
