class User < ActiveRecord::Base
  attr_accessible :password_digest, :session_token, :username
  attr_accessible :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!

    self.session_token
  end

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return user if !!user && user.is_password?(password)
    nil
  end

  def is_password?(pass)
    BCrypt::Password.new(self.password_digest).is_password?(pass)
  end

end
