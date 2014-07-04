module ActiveAdmin::Gallery
  module ActiveRecordExtension

    def has_image(name)
      has_one name,
        -> { where(imageable_relation: name.to_s) },
        as: :imageable,
        class_name: "ActiveAdmin::Gallery::Image"

      define_method "#{name}=" do |image|
        super(image)
        image.imageable_relation = name
      end

      accepts_nested_attributes_for name, allow_destroy: true, reject_if: :all_blank
    end

    def has_many_images(name)
      has_many name,
        -> { where(imageable_relation: name.to_s) },
        as: :imageable,
        class_name: "ActiveAdmin::Gallery::Image"

      define_method "#{name}=" do |images|
        super(images)
        images.each do |image|
          image.imageable_relation = name
        end
      end

      accepts_nested_attributes_for name, allow_destroy: true, reject_if: :all_blank
    end

  end
end

