require 'byebug'
class User < ActiveRecord::Base

  before_validation :ensure_session_token

  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6, null: true }


  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil if user.nil?

    if is_password?(password)
      user
    else
      errors[:base] << "Incorrect username or password."
    end
  end

  def password=(password)
    # debugger
    @password = password

    self.password_digest = BCrypt::Password.create(password)
  end

  def password
    @password
  end

  def is_password?(password)
    password_digest = BCrypt::Password.new(password_digest)
    password_digest == BCrypt::Password.is_password?(password)
  end

  def generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    save!
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end


end
