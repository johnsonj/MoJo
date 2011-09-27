class ChangeItemHistoryRunningDistanceToFloat < ActiveRecord::Migration
  def up
    change_table :item_histories do |t|
      t.remove :runningdistance
      t.float :runningdistance
    end
  end

  def down
  end
end
