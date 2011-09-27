class AddIconToImages < ActiveRecord::Migration
    def self.up
    remove_column :images, :image
    add_column :images, :icon_file_name, :string # Original filename
    add_column :images, :icon_content_type, :string # Mime type
    add_column :images, :icon_file_size, :integer # File size in bytes
  end

  def self.down
    add_column :images, :image, :binary
    remove_column :images, :icon_file_name
    remove_column :images, :icon_content_type
    remove_column :images, :icon_file_size
  end
end
