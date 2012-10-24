class CreateActiveAdminGalleryImages < ActiveRecord::Migration

  def change
    create_table :active_admin_gallery_images do |t|
      t.integer  :imageable_id
      t.string   :imageable_type
      t.string   :imageable_relation
      t.string   :alt
      t.string   :title
      t.string   :image_name
      t.string   :image_uid
    end
    add_index :active_admin_gallery_images, [:imageable_id, :imageable_type, :imageable_relation], name: 'active_admin_gallery_images_imageable'
  end

end
