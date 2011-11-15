class RemoveItemsMissedByReset < ActiveRecord::Migration
  def up
    ItemHistory.where("item_id not in (?)", Item.select('id')).each do |hist|
      hist.destroy
    end
  end

  def down
    #no going back on this one
  end
end
