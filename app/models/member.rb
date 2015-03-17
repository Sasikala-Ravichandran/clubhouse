class Member < ActiveRecord::Base
	has_many :posts
    has_secure_password
	 
	validates :name, presence: true, 
	                 length: { minimum: 2, maximum: 10 },
	                 uniqueness: { case_sensitive: false }
	validates :password, presence: true,
						 length: { minimum: 6 }

end
