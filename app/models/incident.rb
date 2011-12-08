class Incident < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :this_date, :description, :lat, :lon, :user_id
    validates_inclusion_of :lat, :in => -90..90, :message => "Lat must be in [-90,90]"
    validates_inclusion_of :lon, :in => -90..90, :message => "Lon must be in [-90,90]"
end
