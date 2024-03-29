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

class Image < ActiveRecord::Base

  has_one :item_description
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
                    :bucket => S3_CONFIG['bucket']
end
