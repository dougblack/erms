class Request < ActiveRecord::Base
  belongs_to :resource
  belongs_to :incident
  def incident
      return Incident.find_by_id(self.incident_id)
  end
  def resource
      return Resource.find_by_id(self.resource_id)
  end
end
