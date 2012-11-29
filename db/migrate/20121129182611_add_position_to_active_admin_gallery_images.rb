class AddPositionToActiveAdminGalleryImages < ActiveRecord::Migration

  def change
    add_column :active_admin_gallery_images, :position, :integer
  end

end
