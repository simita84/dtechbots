class Admin < ActiveRecord::Base
 
  has_secure_password
  attr_accessible :password_digest, :username, :password, :password_confirmation

  validates_uniqueness_of :username


end
