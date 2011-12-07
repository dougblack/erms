class Company < ActiveRecord::Base
    validates_presence_of :username, :headquarters
end
