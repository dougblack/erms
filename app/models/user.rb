class User < ActiveRecord::Base
    has_many :resources
    has_many :incidents
end
