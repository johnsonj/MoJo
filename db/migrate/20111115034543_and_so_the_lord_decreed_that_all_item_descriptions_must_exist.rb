class AndSoTheLordDecreedThatAllItemDescriptionsMustExist < ActiveRecord::Migration
  def up
    descs = ItemDescription.select('id')
    Item.where("item_description_id not in (?)", descs).each do |item|
      item.item_description_id = descs.first.id
      item.save
    end
  end

  def down
    #no going back on this one
  end
end
