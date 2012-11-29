module ActiveAdmin
  module Gallery

    class Engine < ::Rails::Engine
      engine_name "activeadmin_gallery"

      initializer "Railsyard precompile hook" do |app|
        app.config.assets.precompile += [
          "active_admin/gallery/sortable.js",
        ]
      end

      initializer "add assets" do
        ActiveAdmin.application.register_javascript "active_admin/gallery/sortable.js"
      end
    end

  end
end
