class Governmentagency < ActiveRecord::Base
    validates_presence_of :username, :jurisdiction
end
