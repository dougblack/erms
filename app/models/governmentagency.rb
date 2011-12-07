class Governmentagency < ActiveRecord::Base
    validates_presence_of :username, :jusrisdiction
end
