class Capability < ActiveRecord::Base
  belongs_to :resource
  validates_presence_of :capability
end
