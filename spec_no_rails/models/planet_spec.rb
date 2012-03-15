require 'active_record'

db = YAML.load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection(db['test'])

module Refinery
  module Core
    class BaseModel < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end

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
