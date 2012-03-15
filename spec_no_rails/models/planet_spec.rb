require_relative '../engines_helper'
require 'planets/app/models/refinery/planets/planet'

module Refinery
  module Planets
    describe Planet do
      before :each do
        Planet.delete_all
      end

      it "has a name" do
        planet = Planet.create!(:name => 'Mars')
        planet.name.should == 'Mars'
      end
    end
  end
end
