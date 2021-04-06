class User < ActiveRecord::Base
  
  has_secure_password

  validates :email, presence: true
  validates :name, presence: true
  validates :password_confirmation, presence: true
  validates_uniqueness_of :email, :case_sensitive => false
  validates :password, length: { minimum: 8 }


end
