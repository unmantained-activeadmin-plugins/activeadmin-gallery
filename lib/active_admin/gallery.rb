require 'active_admin/gallery/engine'
require 'active_admin/gallery/active_record_extension'
require 'active_admin/gallery/form_builder_extension'

ActiveRecord::Base.send :extend, ActiveAdmin::Gallery::ActiveRecordExtension
ActiveAdmin::FormBuilder.send :include, ActiveAdmin::Gallery::FormBuilderExtension

