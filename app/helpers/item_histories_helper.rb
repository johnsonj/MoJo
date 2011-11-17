module ItemHistoriesHelper

  def user_has_owned(id)
    ItemHistory.where(:user_id => current_user.id, :item_id => id)
  end

end
