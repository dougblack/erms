# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(:username => "doug", :name => "Doug", :password => "doug", :usertype => "Individual")
User.create(:username => "gt", :name => "Georgia Tech", :password => "Go Jackets", :usertype => "Government Agency")
Governmentagency.create(:username => "gt", :jurisdiction => "Atlanta, GA")
User.create(:username => "ga", :name => "Georgia", :password => "Atlanta", :usertype => "Municipality")
Municipality.create(:username => "ga", :population => "80000")
User.create(:username => "gp", :name => "Georgia Power", :password => "gp", :usertype => "Company")
Company.create(:username => "gp", :headquarters => "Atlanta, GA")

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
