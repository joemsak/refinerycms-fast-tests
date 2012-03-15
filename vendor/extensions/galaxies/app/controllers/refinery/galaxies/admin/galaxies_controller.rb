module Refinery
  module Galaxies
    module Admin
      class GalaxiesController < ::Refinery::AdminController

        crudify :'refinery/galaxies/galaxy',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
