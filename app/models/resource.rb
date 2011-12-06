

class Resource < ActiveRecord::Base
  belongs_to :user
  belongs_to :esf
  belongs_to :costperitem
  def distanceFrom(i)
    deltalat = self.lat - i.lat
    deltalon = self.lon - i.lon
    a =  Math.sin(deltalat/2)**2 + Math.cos(self.lat)*Math.cos(i.lat)*Math.sin(deltalon/2)**2    
    b = 2*Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
    return 6731 * b
  end
end
