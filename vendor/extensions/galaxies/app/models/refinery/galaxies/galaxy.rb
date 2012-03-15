module Refinery
  module Galaxies
    class Galaxy < Refinery::Core::BaseModel
      self.table_name = 'refinery_galaxies'

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true

    end
  end
end
