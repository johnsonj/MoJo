# == Schema Information
#
# Table name: images
#
#  id                :integer         not null, primary key
#  created_at        :datetime
#  updated_at        :datetime
#  icon_file_name    :string(255)
#  icon_content_type :string(255)
#  icon_file_size    :integer
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
                    :s3_credentials => S3_CONFIG,
                    :path => ":attachment/:id/:style.:extension",
                    :bucket => 'MoJoIcons'
end
