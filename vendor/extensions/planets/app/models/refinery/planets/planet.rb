module Refinery
  module Planets
    class Planet < Refinery::Core::BaseModel
      self.table_name = 'refinery_planets'

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true

    end
  end
end
