module ActiveAdmin::Gallery
  class Image < ActiveRecord::Base
    self.table_name = "active_admin_gallery_images"
    belongs_to :imageable, polymorphic: true

    image_accessor :image
    validates :image, presence: true, unless: :remove_image
    validates_size_of :image, :maximum => 3.megabyte
    validates_property :format, of: :image, in: [:jpeg, :jpg, :png, :tif, :tiff, :gif], case_sensitive: false

    default_scope { order(:position) if column_names.include?('position') }
  end
end
