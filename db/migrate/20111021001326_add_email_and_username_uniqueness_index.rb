class AddEmailAndUsernameUniquenessIndex < ActiveRecord::Migration
  def up
    unique = []
    User.all.each do |usr|
      if unique.include?(usr.username) || unique.include?(usr.email)
        usr.destroy
        puts 'found one'
      else
        unique << usr.username
        unique << usr.email
      end
    end
    add_index :users, :email, :unique => true
    add_index :users, :username, :unique => true
  end

  def down
    remove_index :users, :email
    remove_index :users, :username
  end
end
