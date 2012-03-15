require 'active_record'

module Refinery
  module Core
    class BaseModel < ActiveRecord::Base
    end
  end
end

require 'planets/app/models/refinery/planets/planet'

module Refinery
  module Planets
    describe Planet do
      it "has a name" do
        planet = Planet.create!(:name => 'Mars')
        planet.name.should == 'Mars'
      end
    end
  end
end
