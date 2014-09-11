class Member < ActiveRecord::Base
  
  has_secure_password
  attr_accessible :first_name, :last_name, :password_digest,
  					 :username,:password, :password_confirmation

  validates_uniqueness_of :username

end
