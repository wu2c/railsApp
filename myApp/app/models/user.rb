class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :password_digest
  attr_accessor :password, :password_confirmation
  has_secure_password
  validates_presence_of :password, :on => :create
  
  validates :password, :length => { 
  						:in => 6..10,
						:too_short => "must have at least %{count} words",
						:too_long => "must have at most %{count} words"
						}
			
   EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
   validates :email, :uniqueness => true, :presence => true, :format => EMAIL_REGEX	
   
   #hash and encrypt password, nerver stored pw in a plain text in db
   before_save :encrypt_password
   after_save :clear_password
   
   def encrypt_password
   		if password.present?
			salt = BCrypt::Engine.generate_salt
			self.password_digest = BCrypt::Engine.hash_secret(password,salt)
		end
	end
	
	def clear_password
		self.password = nil
	end	
end
