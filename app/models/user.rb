class User < ActiveRecord::Base
	has_many :locations, :order => "updated_at DESC", :limit => 3, :dependent => :destroy
	validates_uniqueness_of :email
	validates_presence_of :email, :name
end
