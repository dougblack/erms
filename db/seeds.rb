# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Esf.create(:description => "Transportation")
Esf.create(:description => "Communications")
Esf.create(:description => "Public Works and Engineering")
Esf.create(:description => "Firefighting")
Esf.create(:description => "Emergency Management")
Esf.create(:description => "Mass Care, Emergency Assistance, Housing, and Human Services")
Esf.create(:description => "Logistics Management and Resource Support")
Esf.create(:description => "Public Health and Medical Services")
Esf.create(:description => "Search and Rescue")
Esf.create(:description => "Oil and Hazardous Materials Response")
Esf.create(:description => "Agriculture and Natural Resources")
Esf.create(:description => "Energy")
Esf.create(:description => "Public Safety and Security")
Esf.create(:description => "Long-Term Community Recovery")
Esf.create(:description => "External Affairs")


User.create(:username => "doug", :name => "Doug", :password => "doug", :usertype => "Individual")
Costperitem.create(:item => "vehicle")
Costperitem.create(:item => "house")
Resource.create(:name => "Sports car", :model => "Lamborghini", :cost => "80000", :costperitem_id => "1", :user_id => "1", :esf_id => "1", :lat => "0", :lon => "0")
Resource.create(:name => "House", :model => "A big one", :cost => "300000", :costperitem_id => "2", :user_id => "1", :esf_id => "6", :lat => "0", :lon => "0")
Capability.create(:resource_id => "1", :capability => "Goes really fast")
Capability.create(:resource_id => "2", :capability => "Has a big screen")
Addesf.create(:esf_id => "9", :resource_id => "1")
Incident.create(:description => "Cat stuck in a tree", :lat => "0", :lon => "0", :this_date => "Fri, 09 Dec 2011 15:12:00 UTC +00:00", :user_id => "1")
Incident.create(:description => "Car needs washing", :lat => "0", :lon => "0", :this_date => "Fri, 09 Dec 2011 15:12:00 UTC +00:00", :user_id => "1")

User.create(:username => "gt", :name => "Georgia Tech", :password => "gt", :usertype => "Government Agency")
Governmentagency.create(:username => "gt", :jurisdiction => "Atlanta, GA")
Costperitem.create(:item => "bus")
Costperitem.create(:item => "day")
Resource.create(:name => "Stinger", :model => "Bus", :esf_id => "1", :cost => "80000", :costperitem_id =>"3", :lat => "10", :lon => "10", :user_id => "2")
Resource.create(:name => "Police", :model => "GT Campus police", :esf_id => "12", :cost => "10000", :costperitem_id => "4", :lat => "10", :lon => "10", :user_id => "2")
Capability.create(:resource_id => "4", :capability => "Looks badass")
Addesf.create(:esf_id => "9", :resource_id => "3")
Addesf.create(:esf_id => "10", :resource_id => "3")
Addesf.create(:esf_id => "11", :resource_id => "3")
Incident.create(:description => "Classes are way too hard", :lat => "10", :lat => "10", :this_date => "Fri, 09 Dec 2011 15:12:00 UTC +00:00", :user_id => "2")

User.create(:username => "ga", :name => "Georgia", :password => "ga", :usertype => "Municipality")
Municipality.create(:username => "ga", :population => "80000")
Resource.create(:name => "Police", :model => "Atlanta police", :esf_id => "12", :cost => "10000", :costperitem_id => "4", :lat => "20", :lon => "-20", :user_id => "3")
Capability.create(:resource_id => "5", :capability => "Bad at their job")

User.create(:username => "gp", :name => "Georgia Power", :password => "gp", :usertype => "Company")
Company.create(:username => "gp", :headquarters => "Atlanta, GA")
Costperitem.create(:item => "A whole lot of power")
Resource.create(:name => "Power", :model => "Coal power :(", :esf_id => "11", :cost => "30000", :costperitem_id => "5", :lat => "20", :lon => "20", :user_id => "4")
