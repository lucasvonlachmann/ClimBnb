module ApplicationHelper

  def photo_helper(obj)
    obj.photo.present? ? obj.photo : asset_url(obj.class::DEFAULT_PHOTO_URL)
  end

end
