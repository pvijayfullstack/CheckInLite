# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
User.delete_all
Location.delete_all

users = User.create(:name => "Mike Shea", :email => "mike@mikeshea.net", :password => "thx1138")
Location.create(:name => "Home", :user_id => users.id, :address => "2808 Kelly Square, Vienna, VA 22181", :contact_info => "mike@mikeshea.net" )
Location.create(:name => "MITRE", :user_id => users.id, :address => "7515 Colshire Blvd. Mclean, VA 22102", :contact_info => "mshea@mitre.org" )
