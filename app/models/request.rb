class Request < ActiveRecord::Base
  belongs_to :resource
  belongs_to :incident
  validates_presence_of :resource_id, :incident_id
  def incident
      return Incident.find_by_sql("select * from incidents where id = #{self.incident_id}")
  end
  def resource
      return Resource.find_by_id("select * from resources where id = #{self.resource_id}")
  end
end
