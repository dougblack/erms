class User < ActiveRecord::Base
    has_many :resources
    has_many :incidents
    validates_presence_of :username, :password, :name, :usertype
    def info
       if self.usertype == "Company"
           return "Headquarters: #{Company.find_by_sql("SELECT companies.* FROM companies WHERE companies.username = '#{self.username}' LIMIT 1").first.headquarters}"
       elsif self.usertype == "Municipality" 
           return "Population: #{Municipality.find_by_sql("SELECT municipalities.* FROM municipalities WHERE municipalities.username = '#{self.username}' LIMIT 1").first.population}"
       elsif self.usertype == "Government Agency"
           return "Jurisdiction: #{Governmentagency.find_by_sql("SELECT governmentagencies.* FROM governmentagencies WHERE governmentagencies.username = '#{self.username}' LIMIT 1").first.jurisdiction}"
       else
           return ""
       end
    end
end
