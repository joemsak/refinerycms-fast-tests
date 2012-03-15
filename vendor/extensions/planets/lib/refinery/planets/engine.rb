module Refinery
  module Planets
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Planets

      engine_name :refinery_planets

      initializer "register refinerycms_planets plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "planets"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.planets_admin_planets_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/planets/planet',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Planets)
      end
    end
  end
end
