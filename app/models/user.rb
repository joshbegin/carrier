class User < ActiveRecord::Base
  
  #Use Rails 3.1 authentication
  has_secure_password

  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation

  validates :password, confirmation: true,
            length: { within: 6..40 }
  validates :email, :first_name, :last_name, presence: true
  validates :email, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
