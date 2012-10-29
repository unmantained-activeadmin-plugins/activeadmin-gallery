module ActiveAdmin
  module Gallery

    class Engine < ::Rails::Engine
      engine_name "activeadmin_gallery"

      initializer "require dragonfly", group: :all do |app|
        ActiveSupport.on_load(:active_record) do
          require 'active_admin/gallery/image'
        end
      end
    end

  end
end
