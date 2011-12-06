class Request < ActiveRecord::Base
  belongs_to :incident
  belongs_to :resource
end
