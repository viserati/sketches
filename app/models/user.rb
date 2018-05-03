class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email

  # Create SESSIONS for active user and terminate on signing out..
end
