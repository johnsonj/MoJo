# == Schema Information
#
# Table name: images
#
#  id                :integer         primary key
#  created_at        :timestamp
#  updated_at        :timestamp
#  icon_file_name    :string(255)
#  icon_content_type :string(255)
#  icon_file_size    :integer
#

require 'spec_helper'

describe Image do
  pending "add some examples to (or delete) #{__FILE__}"
end
