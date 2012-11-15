class User < ActiveRecord::Base
  include SessionsHelper

  #Use Rails 3.1 authentication
  has_secure_password

  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation

  before_create { create_remember_token(:remember_token) }

  validates :password, confirmation: true,
            length: { within: 6..40 }
  validates :email, :first_name, :last_name, presence: true
  validates :email, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end
  
  def send_active_confirmation_email
    UserMailer.confirm_active(self).deliver
  end
  
  def send_admin_confirmation_email
    UserMailer.admin_confirmation(self).deliver
  end
  
  def send_password_reset
    create_remember_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  default_scope order( "first_name ASC" )
  scope :admins, where(admin: true)

  private

    def create_remember_token(column)
      #self.remember_token = SecureRandom.urlsafe_base64
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end
end
