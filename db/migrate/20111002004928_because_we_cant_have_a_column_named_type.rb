class BecauseWeCantHaveAColumnNamedType < ActiveRecord::Migration
    def up
      remove_column :users, :type
      add_column :users, :user_type, :string, { :default => "normal", :null => false}
    end

    def down
      remove_column :users, :user_type
      add_column :users, :type, :string, { :default => "normal", :null => false}
    end
end
