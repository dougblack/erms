class Incident < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :this_date, :description, :lat, :lon, :user_id
end
