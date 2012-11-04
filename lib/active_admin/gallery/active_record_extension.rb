module ActiveAdmin::Gallery
  module ActiveRecordExtension

    def has_image(name)
      has_one name,
        as: :imageable,
        class_name: "ActiveAdmin::Gallery::Image",
        conditions: { imageable_relation: name }

      define_method "#{name}=" do |image|
        super(image)
        image.imageable_relation = name
      end

      accepts_nested_attributes_for name, allow_destroy: true, reject_if: proc { |a|
        %w(image remove_image retained_image).all? {|f| a[f].blank? }
      }
      attr_accessible :"#{name}_attributes"
    end

    def has_many_images(name)
      has_many name,
        as: :imageable,
        class_name: "ActiveAdmin::Gallery::Image",
        conditions: { imageable_relation: name }

      define_method "#{name}=" do |images|
        super(images)
        images.each do |image|
          image.imageable_relation = name
        end
      end

      accepts_nested_attributes_for name, allow_destroy: true, reject_if: proc { |a|
        %w(image remove_image retained_image).all? {|f| a[f].blank? }
      }
      attr_accessible :"#{name}_attributes"
    end

  end
end
