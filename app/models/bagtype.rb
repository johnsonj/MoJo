# == Schema Information
#
# Table name: bagtypes
#
#  id         :integer         primary key
#  size       :integer
#  name       :string(255)
#  created_at :timestamp
#  updated_at :timestamp
#

class Bagtype < ActiveRecord::Base
end
