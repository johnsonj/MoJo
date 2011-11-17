module ItemsHelper

  def icon_for_image(item)
    link_to(image_tag(item.thumb), item_home(item.id))
  end

  def item_home(id)
    "/items/#{id}"
  end

end
