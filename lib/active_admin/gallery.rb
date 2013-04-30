begin
  require 'active_admin/gallery/engine'
rescue NameError => e
end

begin
  require 'active_admin/gallery/active_record_extension'
  ActiveRecord::Base.send :extend, ActiveAdmin::Gallery::ActiveRecordExtension
rescue NameError => e
end

begin
  require 'active_admin/gallery/form_builder_extension'
  ActiveAdmin::FormBuilder.send :include, ActiveAdmin::Gallery::FormBuilderExtension
rescue NameError => e
end

