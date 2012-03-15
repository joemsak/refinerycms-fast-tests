module Refinery
  module Galaxies
    class Galaxy < Refinery::Core::BaseModel
      has_many :planets, :class_name => 'Refinery::Planets::Planet'
      self.table_name = 'refinery_galaxies'

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true

      def add_planet(planet)
        planets << planet
      end

    end
  end
end
