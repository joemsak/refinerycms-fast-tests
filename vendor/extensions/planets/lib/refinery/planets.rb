require 'refinerycms-core'

module Refinery
  autoload :PlanetsGenerator, 'generators/refinery/planets_generator'

  module Planets
    require 'refinery/planets/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
