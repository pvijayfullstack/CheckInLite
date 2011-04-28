class User < ActiveRecord::Base

	attr_accessible :name, :email, :password, :password_confirmation
	attr_accessor :password
	before_save :encrypt_password

	validates_uniqueness_of :email
	validates_presence_of :email, :name
	validates_presence_of :password, :on => :create
	validates_confirmation_of :password
	
	def self.authenticate(email, password)
		user = find_by_email(email)
		@db_password = BCrypt::Password.create(password)
		if user && user.password_hash == @db_password
			@user
		else
			@error = "Input Password Hash: " + @db_password +" is not the same as the DB Hash: " + user.password_hash
		end
	end
  
	def encrypt_password
		if password.present?
			self.password_hash = BCrypt::Password.create(password)
		end
	end

	has_many :locations, :order => "updated_at DESC", :limit => 3, :dependent => :destroy
end
