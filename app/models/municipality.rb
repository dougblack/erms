class Municipality < ActiveRecord::Base
    validates_presence_of :username, :population
end
