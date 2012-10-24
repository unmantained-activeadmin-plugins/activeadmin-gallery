require 'active_admin/gallery/engine'
require 'active_admin/gallery/active_record_extension'

ActiveRecord::Base.send :extend, ActiveAdmin::Gallery::ActiveRecordExtension

