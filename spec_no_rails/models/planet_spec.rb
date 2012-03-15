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
    end
  end
end
