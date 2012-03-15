require_relative '../engines_helper'
require 'galaxies/app/models/refinery/galaxies/galaxy'
require 'planets/app/models/refinery/planets/planet'

module Refinery
  describe Galaxies::Galaxy do
    before :each do
      Galaxies::Galaxy.delete_all
      Planets::Planet.delete_all
    end

    describe "the relationship to planets" do
      example "adding a planet to a galaxy" do
        galaxy = Galaxies::Galaxy.create!(:name => 'Milky Way')
        earth = Planets::Planet.create!(:name => 'Earth')
        galaxy.add_planet(earth)
        galaxy.reload.planets.should include(earth)
      end
    end

  end
end
