module ActiveAdmin
  module Gallery
    module FormBuilderExtension
      extend ActiveSupport::Concern

      def has_many_images(relation_name, &block)
        has_many relation_name do |i|
          i.form_buffers.last << template.content_tag(:h4) do
            position = template.content_tag(:span, i.object.position,:class => 'position')
            "Image #{position}".html_safe
          end
          i.input :title
          i.input :image, as: :dragonfly
          i.input :alt
          i.input :position, as: :hidden
          unless i.object.new_record?
            i.input :_destroy, :as => :boolean
          end
          i.form_buffers.last
        end
      end

      def has_image(relation_name, &block)
        object.send("build_#{relation_name}") unless object.send(relation_name).present?
        content = inputs_for_nested_attributes(for: relation_name, class: "inputs") do |form|
          form.input :image, as: :dragonfly
          form.input :title
          form.input :alt
          unless form.object.new_record?
            form.input :_destroy, :as => :boolean
          end
          form.form_buffers.last
        end
        form_buffers.last << content
      end

      module ClassMethods
      end
    end
  end
end
