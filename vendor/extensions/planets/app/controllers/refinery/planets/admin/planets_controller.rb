module Refinery
  module Planets
    module Admin
      class PlanetsController < ::Refinery::AdminController

        crudify :'refinery/planets/planet',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
