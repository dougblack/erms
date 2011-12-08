

class Resource < ActiveRecord::Base
  belongs_to :user
  belongs_to :esf
  belongs_to :costperitem
  has_many :capabilities, :dependent => :destroy
  accepts_nested_attributes_for :capabilities, :reject_if => lambda {|a| a[:capability].blank?}, :allow_destroy => true
  validates_presence_of :name, :cost, :lat, :lon, :user_id, :esf_id, :costperitem_id  
  validates_inclusion_of :lat, :in => -90..90, :message => "Lat must be in [-90, 90]"
  validates_inclusion_of :lon, :in => -90..90, :message => "Lon must be in [-90, 90]"
  def distanceFrom(i)
    deltalat = (self.lat * Math::PI / 180) - (i.lat* Math::PI / 180)
    deltalon = (self.lon* Math::PI / 180) - (i.lon* Math::PI / 180)
    a =  Math.sin(deltalat/2)**2 + Math.cos(self.lat)*Math.cos(i.lat)*Math.sin(deltalon/2)**2    
    b = 2*Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
    return 6731 * b
  end
  
  def inUse?
    inUse = false
    Request.find_by_sql("select * from requests where resource_id = #{self.id}").each do |r|
         if r.status = "In Use"
             inUse = true
         end
    end
    return inUse
  end
  def self.validates_positive_or_zero(*attr_names)
     configuration = { :message => "Cannot be negative" }
     configuration.update(attr_names.pop) if attr_names.last.is_a?(Hash)
     validates_each attr_names do |m, a, v| m.errors.add(a, configuration[:message]) if v<0 end
  end
  validates_positive_or_zero :cost
end
