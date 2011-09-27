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

  # Paperclip
  has_attached_file :icon,
                    :styles =>{
                        :thumb => "100x100",
                        :medium => "200x200",
                        :large => "600x400"
                    },
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => ":attachment/:id/:style.:extension",
                    :bucket => 'MoJoIcons'
end
