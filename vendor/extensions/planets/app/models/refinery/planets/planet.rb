module Refinery
  module Planets
    class Planet < Refinery::Core::BaseModel
      self.table_name = 'refinery_planets'

      validates :name, :presence => true, :uniqueness => true

    end
  end
end
