module ActiveAdmin
  module Gallery
    module FormBuilderExtension
      extend ActiveSupport::Concern

      def has_many_images(relation_name, &block)
        has_many relation_name do |i|
          i.input :title
          i.input :image, as: :dragonfly
          i.input :alt
        end
      end

      def has_image(relation_name, &block)
        semantic_fields_for relation_name, (object.send(relation_name) || object.send("build_#{relation_name}")) do |i|
          i.inputs :image do
            i.input :title
            i.input :image, as: :dragonfly
            i.input :alt
          end
        end
      end

      module ClassMethods
      end
    end
  end
end
