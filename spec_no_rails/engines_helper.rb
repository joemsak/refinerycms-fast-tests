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

def acts_as_indexed(*args)
end
