class Location < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :name, :address, :contact_info, :user_id
end
