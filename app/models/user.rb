class User < ActiveRecord::Base
  
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    is_authenticated = user.authenticate(password)
    (user && is_authenticated) ? user : nil
  end

  validates :email, presence: true
  validates :name, presence: true
  validates :password_confirmation, presence: true
  validates_uniqueness_of :email, :case_sensitive => false
  validates :password, length: { minimum: 8 }

end
