module Refinery
  module Galaxies
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Galaxies

      engine_name :refinery_galaxies

      initializer "register refinerycms_galaxies plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "galaxies"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.galaxies_admin_galaxies_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/galaxies/galaxy',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Galaxies)
      end
    end
  end
end
