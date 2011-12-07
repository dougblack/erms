class Addesf < ActiveRecord::Base
  belongs_to :resource
  belongs_to :esf
  validates_presence_of :resource_id, :esf_id
end
