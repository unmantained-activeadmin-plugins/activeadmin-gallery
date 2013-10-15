module ActiveAdmin
  module Gallery

    class Engine < ::Rails::Engine
      engine_name "activeadmin_gallery"

      initializer "Railsyard precompile hook", group: :all do |app|
        app.config.assets.precompile += [
          "active_admin/gallery/sortable.js",
          "active_admin/gallery.css",
        ]
      end

      initializer "add assets" do
        ActiveAdmin.application.register_javascript "active_admin/gallery/sortable.js"
        ActiveAdmin.application.register_stylesheet "active_admin/gallery.css"
      end
    end

  end
end

