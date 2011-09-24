# == Schema Information
#
# Table name: images
#
#  id         :integer         not null, primary key
#  image      :binary
#  created_at :datetime
#  updated_at :datetime
#

class Image < ActiveRecord::Base
end
