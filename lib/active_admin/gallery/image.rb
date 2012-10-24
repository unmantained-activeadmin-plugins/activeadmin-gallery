module ActiveAdmin::Gallery
  class Image < ActiveRecord::Base
    self.table_name = "active_admin_gallery_images"
    belongs_to :imageable, polymorphic: true
    attr_accessible :alt, :title

    image_accessor :image
    attr_accessible :image, :retained_image, :image_url, :remove_image
    validates :image, presence: true
    validates_size_of :image, :maximum => 3.megabyte
    validates_property :format, of: :image, in: [:jpeg, :jpg, :png], case_sensitive: false
  end
end
