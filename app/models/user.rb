class User < ActiveRecord::Base
  include SessionsHelper

  #Use Rails 3.1 authentication
  has_secure_password

  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation

  before_save :create_remember_token

  validates :password, confirmation: true,
            length: { within: 6..40 }
  validates :email, :first_name, :last_name, presence: true
  validates :email, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end

  default_scope order( "first_name ASC" )

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
