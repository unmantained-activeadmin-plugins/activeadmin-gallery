module ActiveAdmin
  module Gallery
    module FormBuilderExtension
      extend ActiveSupport::Concern

      def has_many_images(relation_name, options = {}, &block)
        options = (options || {}).reverse_merge(components: [:upload], fields: [:title, :alt])
        has_many(relation_name, options.reverse_merge(class: "has_many_images")) do |i|

          preview_size = options[:preview_size] || [ 125, 125 ]
          preview = if i.object.image.present?
            original_url = i.object.image.url
            preview_url = i.object.image.thumb("#{preview_size.first}x#{preview_size.last}#").url
            template.content_tag(:li, class: "image_preview", style: "width: #{preview_size.first}px; height: #{preview_size.last}px") do
              template.link_to(template.image_tag(preview_url), original_url)
            end
          else
            template.content_tag(:li, class: "image_preview", style: "width: #{preview_size.first}px; height: #{preview_size.last}px") do
              template.content_tag(:div, "No image", class: "no_image")
            end
          end

          edit = template.content_tag(:li, class: "edit_button") do
            template.link_to("Edit", "#")
          end

          fields = with_new_form_buffer do
            template.content_tag(:li, class: "fields") do
              template.content_tag(:ol) do
                i.input :image, as: :dragonfly, input_html: options
                i.input :title, as: :text if options[:fields].include? :title
                i.input :alt if options[:fields].include? :alt
                i.input :position, as: :hidden
                i.destroy
                i.form_buffers.last
              end
            end
          end

          preview << fields << edit
        end
      end

      def has_image(relation_name, options = {}, &block)
        options = (options || {}).reverse_merge(components: [:preview, :upload], fields: [:title, :alt])
        object.send("build_#{relation_name}") unless object.send(relation_name).present?
        content = inputs_for_nested_attributes(for: relation_name, class: "inputs has_image") do |form|
          form.input :image, as: :dragonfly, input_html: options
          form.input :title, as: :text if options[:fields].include? :title
          form.input :alt if options[:fields].include? :alt
          form.destroy
          form.form_buffers.last
        end
        form_buffers.last << content
      end

      module ClassMethods
      end
    end
  end
end
