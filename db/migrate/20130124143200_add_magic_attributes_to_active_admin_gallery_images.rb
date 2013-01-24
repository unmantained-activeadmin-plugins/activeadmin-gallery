class AddMagicAttributesToActiveAdminGalleryImages < ActiveRecord::Migration
  def change
    add_column :active_admin_gallery_images, :image_width, :integer
    add_column :active_admin_gallery_images, :image_height, :integer
    add_column :active_admin_gallery_images, :image_aspect_ratio, :float
    add_column :active_admin_gallery_images, :image_depth, :integer
    add_column :active_admin_gallery_images, :image_format, :string
    add_column :active_admin_gallery_images, :image_mime_type, :string
    add_column :active_admin_gallery_images, :image_size, :string
  end
end
