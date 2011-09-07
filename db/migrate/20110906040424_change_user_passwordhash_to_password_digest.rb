class ChangeUserPasswordhashToPasswordDigest < ActiveRecord::Migration
  def self.up
    rename_column :users, :passwordhash, :password_digest
  end

  def self.down
    rename_column :users, :password_digest, :passwordhash
  end
end
